/* jshint loopfunc: true, undef: true, unused: false, strict: false */
/* global ch_sdcka, ch_sdckb, trs_get_prev, dec_item_add_post_text, dec_item_add_comment, hex_add_byte, dark_colors, pkt_start, pkt_end, pkt_add_item, trs_go_before, dec_item_add_data, sample_val, ui_clear, ui_add_ch_selector, dec_item_add_sample_point, DRAW_0, DRAW_1, clear_dec_items, dec_item_new, dec_item_add_pre_text, get_ui_vals, add_to_err_log, trs_get_first, trs_is_not_last, abort_requested, trs_get_next, debug, trs_go_after, sample_rate, get_ch_color */

/*
*************************************************************************************

              SCANASTUDIO 2 MAPLE BUS DECODER

The following commented block allows some related informations to be displayed online

<DESCRIPTION>

  Maple Bus Protocol Decoder.

</DESCRIPTION>

<RELEASE_NOTES>

  V1.0: Initial release

</RELEASE_NOTES>

<AUTHOR_URL>

  mailto:ismell@ismell.org

</AUTHOR_URL>

<HELP_URL>

  http://www.ikalogic.com/ikalogic-products/scanastudio-2/decoders-repository/spi-decoder-online/

</HELP_URL>

            
*************************************************************************************
*/


/* The decoder name as it will apear to the users of this script 
*/
function get_dec_name()
{
  return "Maple Bus";
}


/* The decoder version 
*/
function get_dec_ver()
{
  return "1.0";
}


/* Author 
*/
function get_dec_auth()
{
  return "ismell";
}


/* Graphical user interface for this decoder
*/
function gui()
{
  ui_clear();   // clean up the User interface before drawing a new one.

  ui_add_ch_selector("ch_sdcka","SDCKA (Pin 1)","SDCKA");
  ui_add_ch_selector("ch_sdckb","SDCKB (Pin 2)","SDCKB");

}


/* Constants 
*/
var IDLE   = 0;
var START_FIND_START_FRAME = 1;
var COUNTING_START_FRAME = 2;
var START_FRAME_FOUND = 3;

var sdcka_t, sdckb_t;

var PKT_COLOR_DATA;
var PKT_COLOR_DATA_TITLE;
var PKT_COLOR_START_TITLE;
var PKT_COLOR_ADR_TITLE;
var PKT_COLOR_ACK_TITLE;
var PKT_COLOR_NACK_TITLE;
var PKT_COLOR_STOP_TITLE;
var PKT_COLOR_NOISE_TITLE;

/* This is the function that will be called from ScanaStudio
   to update the decoded items
*/
function decode()
{
  PKT_COLOR_DATA        = get_ch_light_color(ch_sdcka);
  PKT_COLOR_DATA_TITLE  = dark_colors.gray;
  PKT_COLOR_START_TITLE = dark_colors.orange;
  PKT_COLOR_ADR_TITLE   = dark_colors.yellow;
  PKT_COLOR_ACK_TITLE   = dark_colors.green;
  PKT_COLOR_NACK_TITLE  = dark_colors.red;
  PKT_COLOR_STOP_TITLE  = dark_colors.blue;
  PKT_COLOR_NOISE_TITLE = dark_colors.black;

  clear_dec_items();            // Clears all the the decoder items and its content
  
  get_ui_vals();                // Update the content of user interface variables

  if (!check_scanastudio_support()) {
    add_to_err_log("Please update your ScanaStudio software to the latest version to use this decoder");
    return;
  }

  sdcka_t = trs_get_first(ch_sdcka);
  sdckb_t = trs_get_first(ch_sdckb);

  // Find all START and STOP conditions
  while (trs_is_not_last(ch_sdcka) || trs_is_not_last(ch_sdckb)) {
    if (abort_requested())            // Allow the user to abort this script
    {
      return false;
    }

    var start_a = find_start_frame();
    var end_a;
    var data;

    if (start_a) {
      data = parse_data(start_a);

      if (data) {
        display_data(data);
      } else {
        //debug("NO DATA FOUND!");
      }
      
      end_a = find_end_frame();
    }
  }
}

function display_data(data) {
  //debug("Starting packet with " + data.length + " bytes");
  pkt_start("DATA");
  var parse = data.length >= 5;
  var command, lrc = 0;
  data.forEach(function(sample, idx) {
    //debug("Adding data item: "+JSON.stringify(sample));

    var pre = [], post = [], desc, hex_str;

    hex_str = "DATA";

    if (parse) {
      var port, peripherals;

      if (idx === 0) {
        pre.push("Additional Words");
        pre.push("Addl Words");
        pre.push("Words");
        hex_str = "WORDS";
        desc = sample.value + " Additional Words in Frame";
      } else if (idx === 1) {
        pre.push("Sender Address");
        pre.push("Sender Addr");
        pre.push("S Addr");
        hex_str = "SENDER";
        port = get_port_from_address(sample.value);

        peripherals = get_peripherals_from_address(sample.value);

        desc = "Port " + port + " : " + peripherals.join(",");
      } else if (idx === 2) {
        pre.push("Receiver Address");
        pre.push("Receiver Addr");
        pre.push("R Addr");
        hex_str = "RECEIVER";
        port = get_port_from_address(sample.value);

        peripherals = get_peripherals_from_address(sample.value);

        desc = "Port " + port + " : " + peripherals.join(",");
      } else if (idx === 3) {
        pre.push("Command");
        pre.push("Cmd");
        hex_str = "COMMAND";
        command = sample.value;

        desc = get_command_name(command);
      } else if (idx == data.length - 1) {
        pre.push("LRC");
        hex_str = "LRC";

        if (lrc == sample.value) {
          post.push("OK");
          desc = "Packet matches LRC";
        } else {
          post.push("BAD");
          desc = "LRC Error. Packet LRC: " + lrc;
        }
      }

      lrc ^= sample.value;
    }

    pkt_add_item(sample.start, sample.end, hex_str, int_to_str_hex(sample.value), PKT_COLOR_DATA_TITLE, PKT_COLOR_DATA, true);

    hex_add_byte(ch_sdcka, sample.start, sample.end, sample.value);

    draw_bits(ch_sdcka, sample);
    pre.forEach(function(str) {
      dec_item_add_pre_text(str);
    });
    post.forEach(function(str) {
      dec_item_add_post_text(str);
    });
    if (desc) dec_item_add_comment(desc);

  });
  //debug("Ending packet");
  pkt_end();
}

function get_command_name(command) {
  if (command == 1)
    return "Request device information";
  if (command == 2)
    return "Request extended device information";
  if (command == 3)
    return "Reset device";
  if (command == 4)
    return "Shutdown device";
  if (command == 5)
    return "Device information (response)";
  if (command == 6)
    return "Extended device information (response)";
  if (command == 7)
    return "Command acknowledge (response)";
  if (command == 8)
    return "Data transfer (response)";
  if (command == 9)
    return "Get condition";
  if (command == 10)
    return "Get memory information";
  if (command == 11)
    return "Block read";
  if (command == 12)
    return "Block write";
  if (command == 14)
    return "Set condition";
  if (command == -1)
    return "No response";
  if (command == -2)
    return "Function code unsupported (response)";
  if (command == -3)
    return "Unknown command (response)";
  if (command == -4)
    return "Command needs to be sent again (response)";
  if (command == -5)
    return "File error (response)";

  return "Unknown";
}

function get_peripherals_from_address(address) {
  var peripherals = [];

  var peripheral = address & 0x2F;
                
  if (peripheral === 0) {
    peripherals.push("Dreamcast");
  } else {
    if (peripheral & 0x20) {
      peripherals.push("Main");
    }

    if (peripheral & 0x10) {
      peripherals.push("Sub 5");
    }

    if (peripheral & 0x08) {
      peripherals.push("Sub 4");
    }

    if (peripheral & 0x04) {
      peripherals.push("Sub 3");
    }

    if (peripheral & 0x02) {
      peripherals.push("Sub 2");
    }

    if (peripheral & 0x01) {
      peripherals.push("Sub 1");
    }
  }

  return peripherals;
}

function get_port_from_address(address) {
  var port;

  address = address & 0xC0;

  if (address == 0xC0) {
    port = "D";
  } else if (address == 0x80) {
    port = "C";
  } else if (address == 0x40) {
    port = "B";
  } else {
    port = "A";
  }

  return port;
}

function draw_bits(channel, sample) {
  dec_item_new(channel, sample.start, sample.end);
  dec_item_add_data(sample.value);
  sample.bits.forEach(function(bit) {
    //if (bit.channel == channel) {
      dec_item_add_sample_point(channel, bit.sample, bit.value ? DRAW_1 : DRAW_0);
    //}
  });
}

function next_sdcka() {
  sdcka_t = trs_get_next(ch_sdcka);
}

function next_sdckb() {
  sdckb_t = trs_get_next(ch_sdckb);
}

function negative_transitions_before(channel, sample) {
  var count = 0;
  while (trs_is_not_last(ch_sdcka) || trs_is_not_last(ch_sdckb)) {
    if (abort_requested()) {
      return false;
    }

    //debug("Starting with sample " + sdckb_t.sample + " with value " + sdckb_t.val, sdckb_t);

    next_sdckb();

    //debug("Got with sample " + sdckb_t.sample + " with value " + sdckb_t.val, sdckb_t);

    if (sdckb_t.sample < sample) {
      //debug ("Sample is before " + sample);
      if (sdckb_t.val === 0) {
        count += 1;
      }
    } else {
      //debug ("We has passed our mark. we have " + count + " negative transitions");
      return count;
    }
  }
}

function parse_data(start_a, end_a) {
  var phase = 1, count = 0, bits = [];
  var start, end, bit;

  var packet = [];

  while (trs_is_not_last(ch_sdcka) || trs_is_not_last(ch_sdckb)) {
    if (abort_requested()) {
      return false;
    }

    if (phase === 1) {
      //debug("IN Phase 1");
      // Find negative sdcka
      if (sdcka_t.val === 0) {
        if (!start) {
          start = sdcka_t.sample;
        }

        if (negative_transitions_before(ch_sdckb, sdcka_t.sample)) {
          //debug("Found a negative transition", sdckb_t);
          sdckb_t = trs_get_prev(ch_sdckb);
          return packet;
        }

        bit = sample_val(ch_sdckb, sdcka_t.sample);
        bits.push({
          channel: ch_sdcka,
          sample: sdcka_t.sample,
          value: bit
        });

        count += 1;

        //sdckb_t = trs_go_after(ch_sdckb, sdcka_t.sample);

        phase = 2;
      } else {
        next_sdcka();
      }
    } else if (phase === 2) {
      //debug("IN Phase 2");
      // Find negative sdckb
      if (sdckb_t.val === 0) {
        bit = sample_val(ch_sdcka, sdckb_t.sample);
        bits.push({
          channel: ch_sdckb,
          sample: sdckb_t.sample,
          value: bit
        });

        count += 1;

        if (count >= 8) {
          //debug("Byte found");
          end = sdckb_t.sample;

          var bit_array = extract_bits(bits);

          packet.push({
            start: start,
            end: end,
            bits: bits,
            value: bit_array_to_byte(bit_array)
          });

          bits = [];
          count = 0;
          start = null;
          end = null;
        }

        sdcka_t = trs_go_after(ch_sdcka, sdckb_t.sample);
        
        phase = 1;
      } else {
        next_sdckb();
      }
    }
  }
}

function find_start_frame() {
  var start_a, end_a, count = 0;
  while (trs_is_not_last(ch_sdcka) || trs_is_not_last(ch_sdckb)) {
    if (abort_requested()) {
      return null;
    }

    if (start_a) {
      if (end_a) {
        if (sdckb_t.sample >= end_a.sample) {
          
          if (count === 0 || count === 1) {
            // Nothing special ignore it
            start_a = end_a = null;
            count = 0;
          } else if (count === 4 || count === 9 || count === 13) {
            lable_start_frame(start_a.sample, end_a.sample, count);
            return end_a;
          } else {
            lable_start_frame(start_a.sample, end_a.sample, count);

            // Start frame error, keep going
            start_a = end_a = null;
            count = 0;
          }
        } else {
          if (sdckb_t.val === 0) {
            count += 1;
          }

          next_sdckb();
        }
      } else {
        end_a = sdcka_t;
        sdckb_t = trs_go_after(ch_sdckb, start_a.sample);
      }
    } else {
      if (sdcka_t.val === 0) {
        // We caught the first negative edge
        start_a = sdcka_t;
      }

      next_sdcka();
    }
  }

  return null;
}

function find_end_frame() {
  var start_b, end_b, count = 0;
  while (trs_is_not_last(ch_sdcka) || trs_is_not_last(ch_sdckb)) {
    if (abort_requested()) {
      return false;
    }
    //debug ("Looking at sdcka: " + sdcka_t.sample + " sdckb: " + sdckb_t.sample);

    if (start_b) {
      if (end_b) {
        if (sdcka_t.sample >= end_b.sample) {
          //debug("Out of frame with count: " + count);
          if (count === 0 || count === 1) {
            // Nothing special ignore it
            start_b = end_b = null;
            count = 0;
          } else if (count === 2) {
            //debug("Found end frame!");
            lable_end_frame(start_b.sample, end_b.sample, count);
            return start_b;
          } else {
            //debug("Found a bad end frame");
            lable_end_frame(start_b.sample, end_b.sample, count);

            // End frame error, stop
            return null;
          }
        } else {
          if (sdcka_t.val === 0) {
            //debug("Found falling edge on sdcka at " + sdcka_t.sample);
            count += 1;
          }

          next_sdcka();
        }
      } else {
        end_b = sdckb_t;
        //debug("Found rising edge at " + end_b.sample);
        sdcka_t = trs_go_after(ch_sdcka, start_b.sample);
      }
    } else {
      //debug("We are looking for a falling edge on sdckb");
      if (sdckb_t.val === 0) {
        // We caught the first negative edge
        start_b = sdckb_t;
        //debug("Found one at: " + sdckb_t.sample);
      }

      next_sdckb();
    }
  }
  //debug("reached end of samples");

  return null;
}

function lable_start_frame(start_sample, end_sample, count) {
  //debug("Found start frame at: [" + start_sample + ", " + end_sample + "] with count: " + count);
  dec_item_new(ch_sdckb, start_sample, end_sample);

  if (count == 4) {
    dec_item_add_pre_text("Start Frame");
    dec_item_add_pre_text("SF");
  } else if (count == 9) {
    dec_item_add_pre_text("Start Frame w/ CRC");
    dec_item_add_pre_text("SF CRC");
  } else if (count == 13) {
    dec_item_add_pre_text("Start Reset");
    dec_item_add_pre_text("RST");
  } else {
    dec_item_add_pre_text("Frame Error");
    dec_item_add_pre_text("FE");
  }
}

function lable_end_frame(start_sample, end_sample, count) {
  debug("Found end frame at: [" + start_sample + ", " + end_sample + "] with count: " + count);
  dec_item_new(ch_sdcka, start_sample, end_sample);

  if (count == 2) {
    dec_item_add_pre_text("End Frame");
    dec_item_add_pre_text("EF");
  } else {
    dec_item_add_pre_text("End Error");
    dec_item_add_pre_text("FE");
  }
}

function extract_bits(bit_samples) {
  return bit_samples.map(function(sample){ return sample.value; });
}

function bit_array_to_byte(bits) {
  var value = 0;
  for ( var i = 0; i < bits.length; ++i) {
    value = (value << 1) + bits[i];
  }

  return value;
}


/*
*/
function int_to_str_hex (num) {
  var temp = "0x";

  if (num < 0x10)
  {
    temp += "0";
  }

  temp += num.toString(16).toUpperCase();

  return temp;
}


/*
*/
function check_scanastudio_support() {
    if (typeof(pkt_start) != "undefined")
    {
        return true;
    }
    else
    {
        return false;
    }
}


/*
*/
function get_ch_light_color (k)
{
    var chColor = get_ch_color(k);

    chColor.r = (chColor.r * 1 + 255 * 3) / 4;
    chColor.g = (chColor.g * 1 + 255 * 3) / 4;
    chColor.b = (chColor.b * 1 + 255 * 3) / 4;

    return chColor;
}


/*
*/
function get_bit_margin()
{
  var k = 5;
  return ((k * sample_rate) / 10000000);
}

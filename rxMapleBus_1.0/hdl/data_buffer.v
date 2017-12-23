`default_nettype none
//////////////////////
// Data buffer

module data_buffer(
  input wire aclk,
  input wire aresetn,
  input wire enable,
  input wire [7:0] s_tdata,
  input wire s_tvalid,
  output reg [7:0] m_tdata,
  output reg m_tvalid,
  output reg [0:0] m_tstrb,
  output reg [0:0] m_tkeep,
  output reg m_tlast
  );

  //=============Internal Constants======================
  parameter SIZE = 3;
  parameter IDLE           = 3'b001,
            WAIT_FOR_DATA  = 3'b010,
            DONE           = 3'b100;
  //=============Internal Variables======================
  reg   [SIZE-1:0]          current_state;
  reg   [SIZE-1:0]          next_state;

  reg pending; // Does the buffer contain a pending transfer?
  reg [7:0] buffer;

  initial begin
    current_state <= IDLE;
    buffer <= 0;
    pending <= 0;
    m_tdata <= 0;
    m_tvalid <= 0;
    m_tkeep <= 0;
    m_tlast <= 0;
  end

  always @ (posedge aclk) begin: FSM_SEQ
    if (aresetn == 1'b0) begin
      current_state <= IDLE;
    end else begin
      current_state <= next_state;
    end
  end

  always @(*) begin: FSM_COMBO
    case (current_state)
      IDLE:
        if (enable) begin
          next_state = WAIT_FOR_DATA;
        end else begin
          next_state = IDLE;
        end
      WAIT_FOR_DATA:
        if (enable) begin
          next_state = WAIT_FOR_DATA;
        end else begin
          next_state = DONE;
        end
      DONE:
        next_state = IDLE;
      default:
        next_state = IDLE;
    endcase
  end

  // -----------------------------------------
  // Register outputs
  // -----------------------------------------

  always @(posedge aclk) begin: BUFFER
    if (aresetn == 1'b0) begin
      buffer <= 0;
    end else begin
      case (next_state)
        IDLE:
          buffer <= 0;
        WAIT_FOR_DATA:
          if (s_tvalid)
            buffer <= s_tdata;
          else
            buffer <= buffer;
        default:
          buffer <= 0;
      endcase
    end
  end

  always @(posedge aclk) begin: PENDING
    if (aresetn == 1'b0) begin
      pending <= 0;
    end else begin
      case (next_state)
        IDLE:
          pending <= 0;
        WAIT_FOR_DATA:
          if (s_tvalid)
            pending <= 1;
          else
            pending <= pending;
        default:
          pending <= 0;
      endcase
    end
  end

  always @(posedge aclk) begin: TDATA
    if (aresetn == 1'b0) begin
      m_tdata <= 0;
    end else begin
      case (next_state)
        IDLE:
          m_tdata <= 0;
        WAIT_FOR_DATA:
          if (pending && s_tvalid) begin
            m_tdata <= buffer;
          end else begin
            m_tdata <= m_tdata;
          end
        DONE:
          if (pending) begin
            m_tdata <= buffer;
          end else begin
            m_tdata <= m_tdata;
          end
        default:
          m_tdata <= 0;
      endcase
    end
  end

  always @(posedge aclk) begin: TVALID
    if (aresetn == 1'b0) begin
      m_tvalid <= 0;
    end else begin
      case (next_state)
        WAIT_FOR_DATA:
          if (pending && s_tvalid) begin
            m_tvalid <= 1;
          end else begin
            m_tvalid <= 0;
          end
        DONE:
          if (pending) begin
            m_tvalid <= 1;
          end else begin
            m_tvalid <= 0;
          end
        default:
          m_tvalid <= 0;
      endcase
    end
  end

  // Output TLAST on the last byte
  always @(posedge aclk) begin: TLAST
    if (aresetn == 1'b0) begin
      m_tlast <= 0;
      m_tstrb <= 1;
      m_tkeep <= 1;
    end else begin
      case (next_state)
        DONE: begin
          m_tlast <= 1;
          m_tstrb <= 1;
          m_tkeep <= 1;
        end
        default: begin
          m_tlast <= 0;
          m_tstrb <= 1;
          m_tkeep <= 1;
        end
      endcase
    end
  end

endmodule

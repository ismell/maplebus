/*
 * Placeholder PetaLinux user application.
 *
 * Replace this with your application code
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/ioctl.h>
#include <net/if.h>
#include <sys/socket.h>
#include <netpacket/packet.h>
#include <argp.h>

#include <stdint.h>
#include <stdarg.h>
#include <arpa/inet.h>


#define MAPLE_BUS_ALEN      1     /* Octets in one maple bus addr. */
#define MAPLE_BUS_HLEN      4     /* Total octets in header.       */
#define MAPLE_BUS_DATA_LEN  1026  /* Max. octets in payload.       */
#define ETH_P_MAPLE_BUS     0x00F8    /* Maple Bus protocol  */

struct maple_bus_header {
  uint8_t additional_words;
  uint8_t sender;
  uint8_t receiver;
  uint8_t command;
};

int sock_raw;
struct ifreq ifr;

static void die (const char * format, ...)
{
    va_list vargs;
    va_start (vargs, format);
    vfprintf (stderr, format, vargs);
    fprintf (stderr, ".\n");
    exit (1);
}


void PrintData (unsigned char* data , int Size)
{
  int i , j;
  for(i=0 ; i < Size ; i++)
  {
    if( i!=0 && i%16==0)   //if one line of hex printing is complete...
    {
      fprintf(stdout , "         ");
      for(j=i-16 ; j<i ; j++)
      {
        if(data[j]>=32 && data[j]<=128)
          fprintf(stdout , "%c",(unsigned char)data[j]); //if its a number or alphabet
        else
          fprintf(stdout , "."); //otherwise print a dot
      }
      fprintf(stdout , "\n");
    } 
     
    if(i%16==0) fprintf(stdout , "   ");
      fprintf(stdout , " %02X",(unsigned int)data[i]);
             
    if( i==Size-1)  //print the last spaces
    {
      for(j=0;j<15-i%16;j++) 
      {
        fprintf(stdout , "   "); //extra spaces
      }
       
      fprintf(stdout , "         ");
       
      for(j=i-i%16 ; j<=i ; j++)
      {
        if(data[j]>=32 && data[j]<=128) 
        {
          fprintf(stdout , "%c",(unsigned char)data[j]);
        }
        else
        {
          fprintf(stdout , ".");
        }
      }
       
      fprintf(stdout ,  "\n" );
    }
  }
}

void send_maple_packet(unsigned char *data, int size) {
  struct sockaddr_ll addr={0};
  unsigned char maple_addr[]= {0x01,0x23,0x45,0x67}; // I don't think we need this

  addr.sll_family=AF_PACKET;
  addr.sll_ifindex=ifr.ifr_ifindex;
  addr.sll_halen=MAPLE_BUS_HLEN;
  addr.sll_protocol=htons(ETH_P_MAPLE_BUS);
  memcpy(addr.sll_addr,maple_addr,MAPLE_BUS_HLEN);

  if (sendto(sock_raw, data, size, 0, (struct sockaddr*)&addr, sizeof(addr)) < 0) {
    die("%s",strerror(errno));
  }
}

char compute_lrc(unsigned char *data, int size) {
  char lrc = 0;
  int i;

  for (i = 0; i < size; ++i) {
    lrc ^= data[i];
  }

  return lrc;
}

void handle_request_device_info_command(unsigned char *data, int size) {
  unsigned char device_info[] = {
    0x1c, 0x20, 0x00, 0x05,
    0x01, 0x00, 0x00, 0x00,
    0xfe, 0x06, 0x0f, 0x00,
    0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00,
    0x72, 0x44, 0x00, 0xff,
    0x63, 0x6d, 0x61, 0x65,
    0x20, 0x74, 0x73, 0x61,
    0x74, 0x6e, 0x6f, 0x43,
    0x6c, 0x6c, 0x6f, 0x72,
    0x20, 0x20, 0x72, 0x65,
    0x20, 0x20, 0x20, 0x20,
    0x20, 0x20, 0x20, 0x20,
    0x64, 0x6f, 0x72, 0x50,
    0x64, 0x65, 0x63, 0x75,
    0x20, 0x79, 0x42, 0x20,
    0x55, 0x20, 0x72, 0x6f,
    0x72, 0x65, 0x64, 0x6e,
    0x63, 0x69, 0x4c, 0x20,
    0x65, 0x73, 0x6e, 0x65,
    0x6f, 0x72, 0x46, 0x20,
    0x45, 0x53, 0x20, 0x6d,
    0x45, 0x20, 0x41, 0x47,
    0x52, 0x45, 0x54, 0x4e,
    0x53, 0x49, 0x52, 0x50,
    0x4c, 0x2c, 0x53, 0x45,
    0x20, 0x2e, 0x44, 0x54,
    0x20, 0x20, 0x20, 0x20,
    0x01, 0xf4, 0x01, 0xae,
    0x00};
  device_info[sizeof(device_info) - 1] = compute_lrc(device_info, sizeof(device_info) - 1);
  send_maple_packet(device_info, sizeof(device_info));
}

void handle_maple_data(unsigned char *data, int size) {
  struct maple_bus_header *header = (struct maple_bus_header *)data;
  int real_size;

  if (size < 5) {
    printf("Bad Packet: Size to small\n");
    return;
  }

  if (header->additional_words * 4 > size - 5) {
    printf("Bad Packet: Additional words missing. Expected %d but only got %d\n", 
        header->additional_words * 4, size - 5);
    return;
  }
  real_size = header->additional_words * 4 + 5;

  if (compute_lrc(data, real_size)) {
    printf("Bad Packet: LRC does not match\n");
    PrintData(data, size);
    return;
  }

  if (header->command == 1) { // Get device info
    handle_request_device_info_command(data, real_size);
  } else {
    printf("Received unknown packet\n");
    PrintData(data, real_size);
  }
}

int main(int argc, char *argv[])
{
  int i;
  int rx_data_size;
  struct sockaddr_ll addr={0}, src_addr={0};
  socklen_t src_addr_len = 0;
  unsigned char maple_data[1024];
  unsigned char maple_rx_data[2048];

	printf("Hello, PetaLinux World!\n");
	printf("cmdline args:\n");
	while(argc--)
		printf("%s\n",*argv++);

  for (i = 0; i < sizeof(maple_data); ++i) {
    maple_data[i] = i % 255;
  }
  
  sock_raw = socket(PF_PACKET, SOCK_RAW, htons(ETH_P_MAPLE_BUS));

  strcpy(ifr.ifr_name, "maplebus0" );
  ioctl(sock_raw, SIOCGIFINDEX, &ifr);

  src_addr_len = sizeof(src_addr);

  while(1) {
    rx_data_size = recvfrom(sock_raw, maple_rx_data, sizeof(maple_rx_data), 0,
      (struct sockaddr *)&src_addr, &src_addr_len);
    if (rx_data_size < 0) {
        die("%s",strerror(errno));
    }

    handle_maple_data(maple_rx_data, rx_data_size);
  }

  close(sock_raw);
  printf("Finished\n");

	return 0;
}



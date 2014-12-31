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

#include <stdarg.h>
#include <arpa/inet.h>


#define MAPLE_BUS_ALEN      1     /* Octets in one maple bus addr. */
#define MAPLE_BUS_HLEN      4     /* Total octets in header.       */
#define MAPLE_BUS_DATA_LEN  1026  /* Max. octets in payload.       */
#define ETH_P_MAPLE_BUS     0x00F8    /* Maple Bus protocol  */

static void die (const char * format, ...)
{
    va_list vargs;
    va_start (vargs, format);
    vfprintf (stderr, format, vargs);
    fprintf (stderr, ".\n");
    exit (1);
}

int main(int argc, char *argv[])
{
  int s;
  struct sockaddr_ll addr={0};
  struct ifreq ifr;
  const unsigned char maple_addr[]=
    {0x01,0x23,0x45,0x67};
  const unsigned char maple_data[]=
    {0x8A,0xBC,0xDE,0xF0};

	printf("Hello, PetaLinux World!\n");
	printf("cmdline args:\n");
	while(argc--)
		printf("%s\n",*argv++);

  
  s = socket(PF_PACKET, SOCK_RAW, htons(ETH_P_MAPLE_BUS));

  strcpy(ifr.ifr_name, "maplebus0" );
  ioctl(s, SIOCGIFINDEX, &ifr);

  addr.sll_family=AF_PACKET;
  addr.sll_ifindex=ifr.ifr_ifindex;
  addr.sll_halen=MAPLE_BUS_HLEN;
  addr.sll_protocol=htons(ETH_P_MAPLE_BUS);
  memcpy(addr.sll_addr,maple_addr,MAPLE_BUS_HLEN);

  if (sendto(s, maple_data, sizeof(maple_data), 0, (struct sockaddr*)&addr, sizeof(addr)) < 0) {
    die("%s",strerror(errno));
  }

	return 0;
}



#include <gb/gb.h>
#include <stdio.h>
#include "rideGuy1.c"

// Tutorial : https://www.youtube.com/watch?v=HIsWR_jLdwo&list=PLeEj4c2zF7PaFv5MPYhNAkBGrkx4iPGJo&index=1&ab_channel=GamingMonsters

// To Make Sprites: https://flozz.github.io/img2gb/howto.html

// Run with sh ./make.sh

void main()
{
  UINT8 currentSpriteIndex = 0;

  set_sprite_data(0, 2, TILESET);
  set_sprite_tile(0, 0);
  move_sprite(0, 88, 78);
  SHOW_SPRITES;

  while (1)
  {
    switch (joypad())
    {
    case J_LEFT:
      scroll_sprite(0, -10, 0);
      break;
    case J_RIGHT:
      scroll_sprite(0, 10, 0);
      break;
    case J_UP:
      scroll_sprite(0, 0, -10);
      break;
    case J_DOWN:
      scroll_sprite(0, 0, 10);
      break;
    }
    delay(50);
  }
}
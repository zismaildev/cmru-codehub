#include <stdio.h>

int main()
{      
     int r,c; 
     for(r=5; r>=1; r--)
     {
          for(c=1; c<r; c++)
          {
               printf(" ");
          }
          for(c=5; c>=r; c--)
          {
               printf("*");
          }
          printf("\n");
     }
     getch();
}
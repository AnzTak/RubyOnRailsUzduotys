#include <stdio.h>
#include <stdlib.h>

void vardo_spausdinimas(int * mano_vardas)
{
	int i,j,n;
	int A[] = {65,110,122,101,108,105,107,97,32,84,97,107,117,110,0};
	for(i = 0; A[i]; i++)
	{
		n = A[i];
		printf("%c",mano_vardas[n]);
	}
	printf("\n");
}

void paveikslelis (int * mano_vardas, int bg, int pix)
{
	char pic[] = 
	{
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,
		0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,
		0,0,1,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,1,0,0,
		0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,
		0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,
		0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,
		0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,
		0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,
		0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,
		0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	};
	
	int i,j,c = 0;
	
	for(i = 0; i < 15; i++)
	{
		for(j = 0; j < 27; j++)
		{
			if(pic[c] == 0)
			{
				printf("%c",mano_vardas[bg]);
			}
			else 
			{
				printf("%c",mano_vardas[pix]);
			}
			c++;
		}
		printf("\n");
	}
}
int main()
{
	int mano_vardas[128];
	int i;
	for(i = 0; i < 128; i++) mano_vardas[i] = i;
	vardo_spausdinimas(mano_vardas);
	paveikslelis(mano_vardas,32,'@');
	system("pause");
	return 0;
}

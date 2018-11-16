#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char *argv[])
{
	// constants
	int squares = 5;
	int size = 20;
	int canvas = squares * size;
	int mirror = squares / 2 + 1;

	// random seeding
	srand(time(NULL));

	// generate color
	int red = rand() % 255;
	int blue = rand() % 255;
	int green = rand() % 255;
	char color[20];
	snprintf(color, 20, "rgb(%d, %d, %d)", red, blue, green);

	// svg header
	printf("<svg viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'>\n");
	printf("<rect x='0' y='0' width='%d' height='%d' fill='#fff' />\n", canvas, canvas);

	// generate squares
	for (int i = 0; i < mirror; i++) {
		for (int j = 0; j < squares; j++) {
			if (rand() % 2 == 1) {  // 50/50 chance
				int x = i * size;
				int y = j * size;
				printf("<rect x='%d' y='%d' width='%d' height='%d' fill='%s' />",
						x, y, size, size, color);

				if (i < mirror - 1) {
					int altx = (squares - i - 1) * size;
					printf("<rect x='%d' y='%d' width='%d' height='%d' fill='%s' />",
							altx, y, size, size, color);
				}
			}
		}
	}

	// svg footer
	printf("</svg>\n");

	return 0;
}

#include <stdio.h>

int main() {
    int pageFaultCount = 0, pages[50], memory[20], memoryIndex = 0, numberOfPages, numberOfFrames, i, j, k;

    printf("Enter number of pages: ");
    scanf("%d", &numberOfPages);

    printf("Enter the pages: ");
    for (i = 0; i < numberOfPages; i++) {
        scanf("%d", &pages[i]);
    }

    printf("Enter number of frames: ");
    scanf("%d", &numberOfFrames);

    for (i = 0; i < numberOfFrames; i++) {
        memory[i] = -1;
    }

    printf("The Page Replacement Process is -->\n");
    for (i = 0; i < numberOfPages; i++) {
        for (j = 0; j < numberOfFrames; j++) {
            if (memory[j] == pages[i]) {
                break;
            }
        }
        if (j == numberOfFrames) {
            memory[memoryIndex] = pages[i];
            memoryIndex++;
            pageFaultCount++;
        }

        for (k = 0; k < numberOfFrames; k++) {
            printf("\t%d", memory[k]);
        }

        if (j == numberOfFrames) {
            printf("\tPage Fault No: %d", pageFaultCount);
        }
        puts("");

        if (memoryIndex == numberOfFrames) {
            memoryIndex = 0;
        }
    }

    printf("The number of Page Faults using FIFO is: %d\n", pageFaultCount);
    return 0;
}
/*
Enter number of pages: 20
Enter the pages: 7 0 1 2 0 3 0 4 2 3 0 3 2 1 2 0 1 7 0 1
Enter number of frames: 3
*/

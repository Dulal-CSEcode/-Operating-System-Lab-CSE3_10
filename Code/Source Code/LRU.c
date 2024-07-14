#include <stdio.h>

int main() {
    int pageFaultCount = 0, pages[50], memory[20], memoryIndex = 0, numberOfPages, numberOfFrames, i, j, k;
    int pageLastUsed[20] = {-1};

    printf("Enter number of frames: ");
    scanf("%d", &numberOfFrames);

    printf("Enter number of pages: ");
    scanf("%d", &numberOfPages);

    printf("Enter reference string: ");
    for (i = 0; i < numberOfPages; i++) {
        scanf("%d", &pages[i]);
    }

    printf("The LRU Page Replacement Process is -->\n");
    for (i = 0; i < numberOfPages; i++) {
        int page = pages[i];
        int pageFound = 0;

        for (j = 0; j < numberOfFrames; j++) {
            if (memory[j] == page) {
                pageFound = 1;
                pageLastUsed[j] = i + 1;
                break;
            }
        }

        if (!pageFound) {
            int lruIndex = 0;
            for (j = 1; j < numberOfFrames; j++) {
                if (pageLastUsed[j] < pageLastUsed[lruIndex]) {
                    lruIndex = j;
                }
            }

            memory[lruIndex] = page;
            pageLastUsed[lruIndex] = i + 1;
            pageFaultCount++;
        }

        printf("For %d:", page);
        for (k = 0; k < numberOfFrames; k++) {
            printf(" %d", memory[k]);
        }

        if (!pageFound) {
            printf(" :Page Fault No: %d", pageFaultCount);
        } else {
            printf(" :No page fault!");
        }
        printf("\n");
    }

    printf("Total no of page faults using LRU is: %d\n", pageFaultCount);

    return 0;
}

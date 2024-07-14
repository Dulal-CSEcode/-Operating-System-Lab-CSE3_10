#include <stdio.h>

int main() {
    int pageFaultCount = 0, pages[50], memory[20], memoryIndex = 0, numberOfPages, numberOfFrames, i, j, k;
    int pageLastUsed[20] = {-1}; // Initialize with -1 for the first time

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
        int page = pages[i];
        int pageFound = 0;

        // Check if page is already in memory
        for (j = 0; j < numberOfFrames; j++) {
            if (memory[j] == page) {
                pageFound = 1;
                pageLastUsed[j] = i; // Update last used time
                break;
            }
        }

        // If page is not found, find least recently used page
        if (!pageFound) {
            int lruIndex = 0;
            for (j = 1; j < numberOfFrames; j++) {
                if (pageLastUsed[j] < pageLastUsed[lruIndex]) {
                    lruIndex = j;
                }
            }

            // Replace least recently used page
            memory[lruIndex] = page;
            pageLastUsed[lruIndex] = i; // Update last used time
            pageFaultCount++;
        }

        // Print memory state
        printf("For %d:", page);
        for (k = 0; k < numberOfFrames; k++) {
            printf(" %d", memory[k]);
        }

        // Print page fault status
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


#include <stdio.h>

#define MAX 25

void main() {
    int frag[MAX], b[MAX], f[MAX], i, j, nb, nf, temp, highest;
    int bf[MAX], ff[MAX];

    // Initialize arrays
    for (i = 0; i < MAX; i++) {
        b[i] = 0;
        f[i] = 0;
        frag[i] = 0;
        bf[i] = 0;
        ff[i] = 0;
    }

    // Input the number of blocks and files
    printf("Enter the number of blocks: ");
    scanf("%d", &nb);

    printf("Enter the number of files: ");
    scanf("%d", &nf);

    // Input the size of each block
    printf("\nEnter the size of the blocks:\n");
    for (i = 1; i <= nb; i++) {
        printf("Block %d: ", i);
        scanf("%d", &b[i]);
    }

    // Input the size of each file
    printf("Enter the size of the files:\n");
    for (i = 1; i <= nf; i++) {
        printf("File %d: ", i);
        scanf("%d", &f[i]);
    }

    // Best Fit Allocation
    for (i = 1; i <= nf; i++) {
        highest = -1; // Initialize highest with -1 to indicate no block found
        for (j = 1; j <= nb; j++) {
            if (bf[j] == 0) { // Check if block j is free
                temp = b[j] - f[i];
                if (temp >= 0) { // Check if the block can accommodate the file
                    if (highest == -1 || temp < frag[i]) {
                        ff[i] = j; // Record the block number
                        frag[i] = temp; // Record the fragment size
                        highest = temp; // Update the highest
                    }
                }
            }
        }
        if (highest != -1) {
            bf[ff[i]] = 1; // Mark the block as filled
        } else {
            ff[i] = -1; // Indicate that the file could not be allocated
            frag[i] = 0;
        }
    }

    // Output the allocation details
    printf("\nFile_no\tFile_size\tBlock_no\tBlock_size\tFragment");
    for (i = 1; i <= nf; i++) {
        if (ff[i] != -1) {
            printf("\n%d\t\t%d\t\t%d\t\t%d\t\t%d", i, f[i], ff[i], b[ff[i]], frag[i]);
        } else {
            printf("\n%d\t\t%d\t\tNot Allocated\t\t-\t\t-", i, f[i]);
        }
    }
}

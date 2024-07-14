#include <stdio.h>

#define MAX 25

// Function to sort arrays and keep track of original indices
void sort(int arr[], int index[], int size) {
    int temp, tempIndex, i, j;
    for (i = 0; i < size - 1; i++) {
        for (j = i + 1; j < size; j++) {
            if (arr[i] > arr[j]) {
                // Swap the sizes
                temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;

                // Swap the corresponding indices
                tempIndex = index[i];
                index[i] = index[j];
                index[j] = tempIndex;
            }
        }
    }
}

void main() {
    int frag[MAX], b[MAX], f[MAX], original_f[MAX], i, j, nb, nf, temp, highest;
    int bf[MAX], ff[MAX];
    int bIndex[MAX], fIndex[MAX];  // To store the original indices
    int allocatedFiles = 0, totalInternalFragmentation = 0;

    // Initialize arrays
    for (i = 0; i < MAX; i++) {
        b[i] = 0;
        f[i] = 0;
        original_f[i] = 0;
        frag[i] = 0;
        bf[i] = 0;
        ff[i] = 0;
        bIndex[i] = i;  // Initialize block index array
        fIndex[i] = i;  // Initialize file index array
    }

    // Input the number of blocks and files
    printf("Enter the number of blocks: ");
    scanf("%d", &nb);

    printf("Enter the number of files: ");
    scanf("%d", &nf);

    // Input the size of each block
    printf("\nEnter the size of the blocks:\n");
    for (i = 0; i < nb; i++) {
        printf("Block %d: ", i + 1);
        scanf("%d", &b[i]);
    }

    // Input the size of each file
    printf("Enter the size of the files:\n");
    for (i = 0; i < nf; i++) {
        printf("File %d: ", i + 1);
        scanf("%d", &f[i]);
        original_f[i] = f[i]; // Save the original file sizes
    }

    // Sort the block sizes and file sizes in ascending order along with their indices
    sort(b, bIndex, nb);
    sort(f, fIndex, nf);

    // Best Fit Allocation
    for (i = 0; i < nf; i++) {
        highest = -1; // Initialize highest with -1 to indicate no block found
        for (j = 0; j < nb; j++) {
            if (bf[j] == 0) { // Check if block j is free
                temp = b[j] - f[i];
                if (temp >= 0) { // Check if the block can accommodate the file
                    if (highest == -1 || temp < highest) {
                        ff[fIndex[i]] = j; // Record the block number for the original file index
                        highest = temp; // Update the highest
                    }
                }
            }
        }
        if (highest != -1) {
            bf[ff[fIndex[i]]] = 1; // Mark the block as filled
            frag[fIndex[i]] = highest; // Record the fragment size for the original file index
            totalInternalFragmentation += highest; // Update total internal fragmentation
            allocatedFiles++; // Increment the count of allocated files
        } else {
            ff[fIndex[i]] = -1; // Indicate that the file could not be allocated
            frag[fIndex[i]] = 0;
        }
    }

    // Output the allocation details in the original file order
    printf("\nFile_no\tFile_size\tBlock_no\tBlock_size\tFragment");
    for (i = 0; i < nf; i++) {
        if (ff[i] != -1) {
            printf("\n%d\t\t%d\t\t%d\t\t%d\t\t%d", i + 1, original_f[i], bIndex[ff[i]] + 1, b[ff[i]], frag[i]);
        } else {
            printf("\n%d\t\t%d\t\tNot Allocated\t\t-\t\t-", i + 1, original_f[i]);
        }
    }

    // Output the number of allocated files and total internal fragmentation
    printf("\n\nTotal files allocated: %d", allocatedFiles);
    printf("\nTotal internal fragmentation: %d\n", totalInternalFragmentation);
}

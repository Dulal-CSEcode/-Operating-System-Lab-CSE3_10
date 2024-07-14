#include<stdio.h>
#define max 25

void main() {
    int frag[max], b[max], f[max], i, j, nb, nf, temp;
    int allocated_files = 0, total_internal_frag = 0;
    static int bf[max], ff[max];

    printf("\t\tFirst Fit\n");
    printf("\nEnter the number of blocks:");
    scanf("%d", &nb);
    printf("Enter the number of files:");
    scanf("%d", &nf);
    printf("\nEnter the size of the blocks:-\n");

    for (i = 1; i <= nb; i++) {
        printf("Block %d:", i);
        scanf("%d", &b[i]);
    }

    printf("Enter the size of the files :-\n");
    for (i = 1; i <= nf; i++) {
        printf("File %d:", i);
        scanf("%d", &f[i]);
    }

    for (i = 1; i <= nf; i++) {
        for (j = 1; j <= nb; j++) {
            if (bf[j] != 1) { // if bf[j] is not allocated
                temp = b[j] - f[i];
                if (temp >= 0) {
                    ff[i] = j;
                    frag[i] = temp;
                    bf[ff[i]] = 1;
                    allocated_files++;
                    total_internal_frag += frag[i];
                    break;
                }
            }
        }

        if (j > nb) { // if no block is found for the file
            ff[i] = -1;
            frag[i] = -1;
        }
    }

    printf("\nFile_no:\tFile_size:\tBlock_no:\tBlock_size:\tFragment");
    for (i = 1; i <= nf; i++) {
        if (ff[i] != -1) {
            printf("\n%d\t\t%d\t\t%d\t\t%d\t\t%d", i, f[i], ff[i], b[ff[i]], frag[i]);
        } else {
            printf("\n%d\t\t%d\t\tNot Allocated", i, f[i]);
        }
    }

    printf("\n\nTotal number of files allocated: %d", allocated_files);
    printf("\nTotal internal fragmentation: %d", total_internal_frag);

    printf("\n\nUnused blocks:\nBlock_no:\tBlock_size:");
    for (i = 1; i <= nb; i++) {
        if (bf[i] != 1) {
            printf("\n%d\t\t%d", i, b[i]);
        }
    }
}

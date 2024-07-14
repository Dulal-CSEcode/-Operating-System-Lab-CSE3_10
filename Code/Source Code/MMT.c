#include<stdio.h>
/// @brief 
/// @return 
int main() {
    int num_blocks, num_processes;

    printf("Enter the number of Blocks: ");
    scanf("%d", &num_blocks);

    int blocks[num_blocks];
    int block_status[num_blocks]; 
    int unused_blocks = num_blocks; 
    int i;
    for(i = 0; i < num_blocks; i++) {
        printf("Block %d size: ", i+1);
        scanf("%d", &blocks[i]);
        block_status[i] = 0; 
    }

    printf("Enter the number of processes: ");
    scanf("%d", &num_processes);

    int processes[num_processes];
    int process_status[num_processes]; 
    int internal_fragmentation[num_processes]; 
    int total_internal_frag = 0; 

    for(i = 0; i < num_processes; i++) {
        printf("Enter memory required for process %d: ", i+1);
        scanf("%d", &processes[i]);
        process_status[i] = 0; 
    }

    printf("\nOutput: Table\n");
    printf("Processes \tProcesses Size \tBlocks \tBlocks Size \tAllocated \tInt. Frag.\n");

    for(i = 0; i < num_processes; i++) {
        int j;
        int allocated = 0; 
        int internal_frag = 0; 
        for(j = 0; j < num_blocks; j++) {
            if(processes[i] <= blocks[j] && block_status[j] == 0) {
                printf("%d \t\t%d \t\t%d \t%d \t\tYES \t\t%d\n", i+1, processes[i], j+1, blocks[j], blocks[j] - processes[i]);
                block_status[j] = 1; 
                allocated = 1; 
                internal_frag = blocks[j] - processes[i]; 
                total_internal_frag += internal_frag; 
                unused_blocks--; 
                break;
            }
        }
        if(!allocated) {
            printf("%d \t%d \t- \t- \tNO \t-\n", i+1, processes[i]);
        }
        internal_fragmentation[i] = internal_frag; 
    }

    printf("\nTotal Internal Fragmentation: %d\n\n", total_internal_frag);
    printf("Number of Unused Blocks: %d", unused_blocks);

    if (unused_blocks > 0) {
        printf("\nUnused Blocks:\n");
        for (i = 0; i < num_blocks; i++) {
            if (block_status[i] == 0) {
                printf("Block %d size: %d\n", i+1, blocks[i]);
            }
        }
    }
    return 0;
}
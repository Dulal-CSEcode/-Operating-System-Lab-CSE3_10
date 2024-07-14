#include<stdio.h>

int main() {
    int total_memory, total_allocated = 0, external_fragmentation = 0;
    int max_processes = 100; // Maximum number of processes
    int process_memory[max_processes]; // Array to store memory required for each process
    int process_count = 0; // Counter for the number of processes entered

    // Input total memory available
    printf("Enter the total memory available (in Bytes): ");
    scanf("%d", &total_memory);
    printf("\n");

    // Input memory required for each process
    while (total_allocated < total_memory && process_count < max_processes) {
        printf("Enter memory required for process %d (in Bytes): ", process_count + 1);
        scanf("%d", &process_memory[process_count]);
        total_allocated += process_memory[process_count];
        process_count++;
    }

    // Output total memory available
    printf("\nTotal Memory Available - %d\n", total_memory);
    printf("PROCESS\tMEMORY-ALLOCATED\n");

    // Output allocated memory for each process
    for (int i = 0; i < process_count; i++) {
        printf("%d\t%d\n", i + 1, process_memory[i]);
    }

    // Calculate external fragmentation
    external_fragmentation = total_memory - total_allocated;

    // Output total memory allocated and external fragmentation
    printf("\nTotal Memory Allocated is %d\n", total_allocated);
    printf("Total External Fragmentation is %d\n", external_fragmentation);

    return 0;
}

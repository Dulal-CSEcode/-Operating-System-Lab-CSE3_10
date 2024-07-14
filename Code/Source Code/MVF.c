#include<stdio.h>

int main()
{
    int total_memory, total_allocated = 0, external_fragmentation;
    int max_processes = 10;
    int process_memory[max_processes];
    int process_count = 0;

    printf("Enter the total memory available (in Bytes): ");
    scanf("%d", &total_memory);
    printf("\n");


    while (1)
    {
        printf("Enter memory required for process %d (in Bytes): ", process_count + 1);
        scanf("%d", &process_memory[process_count]);

        if (process_memory[process_count] <= (total_memory - total_allocated))
        {
            printf("Memory is allocated for Process %d\n", process_count + 1);
            total_allocated += process_memory[process_count];
            process_count++;
        }
        else
        {
            printf("Memory is Full\n");
            break;
        }

        printf("Do you want to continue (y/n): ");
        char ch;
        scanf(" %c", &ch);
        if (ch == 'n')
            break;
    }

    printf("\nTotal Memory Available - %d\n", total_memory);
    printf("PROCESS\tMEMORY-ALLOCATED\n");

    for (int j = 0; j < process_count; j++)
    {
        printf("%d\t%d\n", j + 1, process_memory[j]);
    }

    external_fragmentation = total_memory - total_allocated;
    printf("\nTotal Memory Allocated is %d\n", total_allocated);
    printf("Total External Fragmentation is %d\n", external_fragmentation);

    return 0;
}

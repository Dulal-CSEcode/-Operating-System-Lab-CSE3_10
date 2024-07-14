#include<stdio.h>

int main()
{
    int ms, bs, nob, ef, n, mp[10], tif = 0;
    int i, p = 0;

    printf("Enter the total memory available (in Bytes): ");
    scanf("%d", &ms);

    printf("Enter the block size (in Bytes): ");
    scanf("%d", &bs);

    nob = ms / bs;
    ef = ms - nob * bs;

    printf("\nEnter the number of processes: ");
    scanf("%d", &n);
    printf("\n");

    for (i = 0; i < n; i++)
    {
        printf("Enter memory required for process %d (in Bytes): ", i + 1);
        scanf("%d", &mp[i]);
    }

    printf("\nNo. of Blocks available in memory: %d\n", nob);
    printf("\nPROCESS\tMEMORY REQUIRED\tALLOCATED\tINTERNAL FRAGMENTATION\n");

    for (i = 0; i < n && p < nob; i++)
    {
        printf("%d\t\t%d", i + 1, mp[i]);

        if (mp[i] > bs)
            printf("\t\tNO\t\t---\n");
        else
        {
            printf("\t\tYES\t\t%d\n", bs - mp[i]);
            tif = tif + bs - mp[i];
            p++;
        }
    }

    if (i < n)
        printf("\nMemory is Full, Remaining Processes cannot be accommodated.\n");

    printf("\nTotal Internal Fragmentation is %d\n", tif);
    printf("Total External Fragmentation is %d\n", ef);

    return 0;
}

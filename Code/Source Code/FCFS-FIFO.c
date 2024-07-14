#include<stdio.h>

int main() {
    int p[20], bt[20], wt[20], tat[20], i, n;
    float wtavg = 0, tatavg = 0;

    printf("Enter the number of processes: ");
    scanf("%d", &n);
    printf("\n");

    for(i = 0; i < n; i++) {
        printf("Enter the Burst Time for process %d: ", i+1);
        scanf("%d", &bt[i]);
    }

    wt[0] = wtavg = 0;
    tat[0] = tatavg = bt[0];

    for(i = 1; i < n; i++) {
        wt[i] = tat[i-1];
        tat[i] = bt[i] + wt[i];
        wtavg += wt[i];
        tatavg += tat[i];
    }

    printf("\nPROCESS\t\tBURST TIME\tWAITING TIME\tTURNAROUND TIME\n");

    for(i = 0; i < n; i++) {
        printf("P%d \t\t %d \t\t %d \t\t %d\n", i, bt[i], wt[i], tat[i]);
    }

    printf("\nAverage Waiting Time: %f\n", wtavg / n);
    printf("Average Turnaround Time: %f\n", tatavg / n);

    return 0;
}


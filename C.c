#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char *target = "hello world";
int index = 0;
int pointer = 0;
char ans[100] = "";
char chars[] = "abcdefghijklmnopqrstuvwxyz";

void main_loop() {
    char cur = chars[index++];
    char targetIndex = target[pointer];

    if (targetIndex == ' ') {
        pointer++;
        strcat(ans, " ");
    }

    if (cur == target[pointer]) {
        int len = strlen(ans);
        ans[len] = cur;
        ans[len + 1] = '\0';
        pointer++;
    }

    char toLog[100];
    snprintf(toLog, 100, "%s%c", ans, cur);

    int len = strlen(toLog);
    if (len >= 2 && toLog[len - 2] == 'd' && toLog[len - 1] == 'd') {
        toLog[len - 1] = '\0';
    }

    printf("%s\n", toLog);

    if (strcmp(ans, target) == 0) {
        printf("Successfully logged Hello World!\n");
        exit(0);
    }

    if (index >= 26) index = 0;
    main_loop();
}

int main() {
    main_loop();
    return 0;
}

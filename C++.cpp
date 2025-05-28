#include <iostream>
#include <string>

std::string target = "hello world";
int index = 0;
int pointer = 0;
std::string ans = "";
std::string chars = "abcdefghijklmnopqrstuvwxyz";

void main_loop() {
    char cur = chars[index++];
    char targetIndex = target[pointer];

    if (targetIndex == ' ') {
        pointer++;
        ans += ' ';
    }

    if (cur == target[pointer]) {
        ans += cur;
        pointer++;
    }

    std::string toLog = ans + cur;
    if (toLog.size() >= 2 && toLog.substr(toLog.size() - 2) == "dd") {
        toLog.pop_back();
    }

    std::cout << toLog << std::endl;

    if (ans == target) {
        std::cout << "Successfully logged Hello World!" << std::endl;
        exit(0);
    }

    if (index >= 26) index = 0;
    main_loop();
}

int main() {
    main_loop();
    return 0;
}

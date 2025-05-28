import sys
import time

target = "hello world"
index = 0
pointer = 0
ans = ""
chars = list("abcdefghijklmnopqrstuvwxyz")

def main():
    global index, pointer, ans
    cur = chars[index]
    index += 1
    targetIndex = ''
    if pointer < len(target):
        targetIndex = target[pointer]
    
    if targetIndex == " ":
        pointer += 1
        ans += " "

    if cur == targetIndex:
        ans += cur or " "
        pointer += 1

    toLog = ans + cur

    print(toLog[:-1] if toLog.endswith("dd") else toLog)

    if ans == target:
        print("Successfully logged Hello World!")
        sys.exit()

    if index >= 26:
        index = 0
    
    time.sleep(0) 
    main()

main()
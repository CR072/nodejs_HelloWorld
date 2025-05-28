import asyncio
import sys

target = "hello world"
index = 0
pointer = 0
ans = ""
chars = list("abcdefghijklmnopqrstuvwxyz")

async def log_char(char_to_log):
    global pointer, ans
    await asyncio.sleep(0)
    cur_target_char = ''
    if pointer < len(target):
        cur_target_char = target[pointer]

    if cur_target_char == " ":
        pointer += 1
        ans += " "

    if char_to_log == cur_target_char:
        ans += char_to_log or " "
        pointer += 1

    to_log = ans + char_to_log

    print(to_log[:-1] if to_log.endswith("dd") else to_log)

    if ans == target:
        print("Successfully logged 'hello world!'")
        sys.exit()

async def main():
    global index
    while pointer < len(target):
        char_to_process = chars[index]
        await log_char(char_to_process)
        index = (index + 1) % len(chars)

if __name__ == "__main__":
    try:
        asyncio.run(main())
    except Exception as e:
        print(e, file=sys.stderr)
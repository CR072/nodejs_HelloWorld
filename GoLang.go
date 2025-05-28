package main

import (
    "fmt"
)

func main() {
    target := "hello world"
    index := 0
    pointer := 0
    ans := ""
    chars := []rune("abcdefghijklmnopqrstuvwxyz")

    for {
        cur := chars[index]
        index++

        if target[pointer] == ' ' {
            pointer++
            ans += " "
        }

        if cur == rune(target[pointer]) {
            ans += string(cur)
            pointer++
        }

        toLog := ans + string(cur)
        if len(toLog) >= 2 && toLog[len(toLog)-2:] == "dd" {
            toLog = toLog[:len(toLog)-1]
        }

        fmt.Println(toLog)

        if ans == target {
            fmt.Println("Successfully logged Hello World!")
            break
        }

        if index >= 26 {
            index = 0
        }
    }
}

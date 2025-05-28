using System;

class Program {
    static string target = "hello world";
    static int index = 0;
    static int pointer = 0;
    static string ans = "";
    static char[] chars = "abcdefghijklmnopqrstuvwxyz".ToCharArray();

    static void Main() {
        MainLoop();
    }

    static void MainLoop() {
        char cur = chars[index++];
        char targetIndex = target[pointer];

        if (targetIndex == ' ') {
            pointer++;
            ans += " ";
        }

        if (cur == target[pointer]) {
            ans += cur;
            pointer++;
        }

        string toLog = ans + cur;
        Console.WriteLine(toLog.EndsWith("dd") ? toLog.Substring(0, toLog.Length - 1) : toLog);

        if (ans == target) {
            Console.WriteLine("Successfully logged Hello World!");
            Environment.Exit(0);
        }

        if (index >= 26) index = 0;
        MainLoop();
    }
}

public class Java {
    public static void main(String[] args) {
        String target = "hello world";
        int index = 0;
        int pointer = 0;
        String ans = "";
        String chars = "abcdefghijklmnopqrstuvwxyz";

        while (true) {
            char cur = chars.charAt(index++);

            if (target.charAt(pointer) == ' ') {
                pointer++;
                ans += " ";
            }

            if (cur == target.charAt(pointer)) {
                ans += cur;
                pointer++;
            }

            String toLog = ans + cur;
            if (toLog.endsWith("dd")) {
                toLog = toLog.substring(0, toLog.length() - 1);
            }

            System.out.println(toLog);

            if (ans.equals(target)) {
                System.out.println("Successfully logged Hello World!");
                break;
            }

            if (index >= 26) index = 0;
        }
    }
}

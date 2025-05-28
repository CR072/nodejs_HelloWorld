fun main() {
    val target = "hello world"
    var index = 0
    var pointer = 0
    var ans = ""
    val chars = ('a'..'z').toList()

    fun loop() {
        val cur = chars[index]
        index++

        val targetIndex = if (pointer < target.length) target[pointer] else null

        if (targetIndex == ' ') {
            pointer++
            ans += " "
        }

        if (cur == target.getOrNull(pointer)) {
            ans += cur
            pointer++
        }

        val toLog = ans + cur

        println(if (toLog.endsWith("dd")) toLog.dropLast(1) else toLog)

        if (ans == target) {
            println("Successfully logged Hello World!")
            return
        }

        if (index >= 26) index = 0
        loop()
    }

    loop()
}

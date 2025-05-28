object HelloWorld extends App {
  val target = "hello world"
  val chars = ('a' to 'z').toList
  var index = 0
  var pointer = 0
  var ans = ""

  def loop(): Unit = {
    val cur = chars(index)
    index += 1

    if (pointer < target.length && target(pointer) == ' ') {
      pointer += 1
      ans += " "
    }

    if (pointer < target.length && cur == target(pointer)) {
      ans += cur
      pointer += 1
    }

    val toLog = ans + cur
    println(if (toLog.endsWith("dd")) toLog.dropRight(1) else toLog)

    if (ans == target) {
      println("Successfully logged Hello World!")
      System.exit(0)
    }

    if (index >= 26) index = 0
    loop()
  }

  loop()
}

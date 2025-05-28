defmodule HelloWorld do
  def run do
    target = "hello world"
    chars = String.codepoints("abcdefghijklmnopqrstuvwxyz")
    loop(target, chars, "", 0, 0)
  end

  defp loop(target, chars, ans, index, pointer) do
    cur = Enum.at(chars, index)
    targetIndex = String.at(target, pointer)

    {ans, pointer} =
      cond do
        targetIndex == " " -> {ans <> " ", pointer + 1}
        cur == String.at(target, pointer) -> {ans <> cur, pointer + 1}
        true -> {ans, pointer}
      end

    toLog = ans <> cur

    IO.puts(
      if String.ends_with?(toLog, "dd"),
        do: String.slice(toLog, 0..-2),
        else: toLog
    )

    if ans == target do
      IO.puts("Successfully logged Hello World!")
      System.halt(0)
    end

    index = rem(index + 1, 26)
    loop(target, chars, ans, index, pointer)
  end
end

HelloWorld.run()

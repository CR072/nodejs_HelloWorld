local target = "hello world"
local index = 1
local pointer = 1
local ans = ""
local chars = {}
for c in ("abcdefghijklmnopqrstuvwxyz"):gmatch"." do table.insert(chars, c) end

function main()
    local cur = chars[index]
    index = index + 1
    local targetIndex = target:sub(pointer, pointer)

    if targetIndex == " " then
        pointer = pointer + 1
        ans = ans .. " "
    end

    if cur == target:sub(pointer, pointer) then
        ans = ans .. cur
        pointer = pointer + 1
    end

    local toLog = ans .. cur
    if toLog:sub(-2) == "dd" then
        print(toLog:sub(1, -2))
    else
        print(toLog)
    end

    if ans == target then
        print("Successfully logged Hello World!")
        os.exit()
    end

    if index > 26 then index = 1 end
    main()
end

main()

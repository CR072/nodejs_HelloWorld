program hello_world
    implicit none
    character(len=11) :: target = "hello world"
    character(len=26) :: chars = "abcdefghijklmnopqrstuvwxyz"
    character(len=100) :: ans = ""
    character(len=100) :: toLog
    integer :: index = 1, pointer = 1, len_ans

    do
        character :: cur
        cur = chars(index:index)
        index = index + 1

        if (target(pointer:pointer) == ' ') then
            pointer = pointer + 1
            len_ans = len_trim(ans)
            ans(len_ans+1:len_ans+1) = ' '
        end if

        if (cur == target(pointer:pointer)) then
            len_ans = len_trim(ans)
            ans(len_ans+1:len_ans+1) = cur
            pointer = pointer + 1
        end if

        toLog = trim(ans) // cur
        if (len_trim(toLog) >= 2) then
            if (toLog(len_trim(toLog)-1:len_trim(toLog)) == 'dd') then
                toLog(len_trim(toLog):len_trim(toLog)) = ''
            end if
        end if

        print *, trim(toLog)

        if (trim(ans) == target) then
            print *, "Successfully logged Hello World!"
            exit
        end if

        if (index > 26) index = 1
    end do
end program hello_world

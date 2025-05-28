target="hello world"
index=0
pointer=0
ans=""
chars=({a..z})

main() {
    cur=${chars[$index]}
    ((index++))
    targetIndex=${target:$pointer:1}

    if [[ "$targetIndex" == " " ]]; then
        ((pointer++))
        ans+=" "
    fi

    if [[ "$cur" == "$targetIndex" ]]; then
        ans+="$cur"
        ((pointer++))
    fi

    toLog="$ans$cur"
    if [[ "$toLog" == *dd ]]; then
        echo "${toLog::-1}"
    else
        echo "$toLog"
    fi

    if [[ "$ans" == "$target" ]]; then
        echo "Successfully logged Hello World!"
        exit
    fi

    if (( index >= 26 )); then
        index=0
    fi

    main
}
main

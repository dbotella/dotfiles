# ------------------------------------------------------------------------------
# ~zozo/.config/bash/functions/math.bash
# ------------------------------------------------------------------------------

digitRegex='^-?[[:digit:]]+$'

# -----------------------------------------------------------------------------
# functions
# -----------------------------------------------------------------------------

abs()
{   # return the absolute value of a number
    [[ $# -eq 1 && $1 =~ $digitRegex ]] || return 1

    declare x="$1"

    [[ $x -lt 0 ]] && x=$((-x))

    echo $x
}

lesserOf()
{   # return the lesser of two numbers
    [[ $# -eq 2 ]] || return 1

    declare x="$1" y="$2" answer

    answer=$(( (x < y) ? x : y ))

    echo $answer
}

greaterOf()
{   # return the greater of two numbers
    [[ $# -eq 2 ]] || return 1

    declare x="$1" y="$2" answer

    answer=$(( (x > y) ? x : y ))

    echo $answer
}

leastOf()
{   # return the smallest of a set of numbers
    declare num least

    for num in "$@"; do
        : ${least:=$num}
        least=$(( (num < least) ? num : least ))
    done

    echo $least
}

greatestOf()
{   # return the largest of a set of numbers
    declare num greatest

    for num in "$@"; do
        : ${greatest:=$num}
        greatest=$(( (greatest > num) ? greatest : num ))
    done

    echo $greatest
}

randInt()
{   # return a random integer
    declare int=-1 min max bound="$@"
    declare regex='^([[:digit:]]+)?(-| )?([[:digit:]]+)?$'

    [[ $bound =~ $regex ]] || {
        printf "Usage: %s [MIN-][MAX]\n" "$FUNCNAME" 1>&2
        return 1
    }

    [[ $bound =~ (-| ) ]] && {
        min="${bound%$BASH_REMATCH*}"
        max="${bound#*$BASH_REMATCH}"
    } || {
        max=$bound
    }

    : ${min:=0}
    : ${max:=32767}

    while [[ $int -lt $min ]]; do
        int=$(( RANDOM % (max + 1) ))
    done

    echo "$int"
}

hex2bin()
{
    echo "obase=2; ibase=16; ${1^^}" | bc
}

bin2hex()
{
    echo "obase=16; ibase=2; $1" | bc
}
[[ $(uname) = "Linux " ]] && setxkbmap -option ctrl:nocaps

# 38 for foreground (use 48 for backgroud).
# 2 used for the format using truecolor.
# Three next numbers are RGB values.
#
# 00m resets the text after the prompt to white.
PS1="\[\033[38:2:255:0:255m\]\h\[\033[38:2:0:255:255m\]\$\[\033[00m\] "

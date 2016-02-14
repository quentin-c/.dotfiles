# ZSH Theme
function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~, ")
}
function prompt_char {
    if [ "$UID" -ne "0" ]
    then
        echo '$'
    else
        echo '#'
    fi
}
function battery_state {
    acpi -b | cut -c 30-34
}
PROMPT=' %{$fg[magenta]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$reset_color%} \
in %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%} $(prompt_char) '
#RPROMPT=' %{$fg[blue]%}$(battery_state)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

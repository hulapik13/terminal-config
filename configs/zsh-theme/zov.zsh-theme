ZOV_CURRENT_TIME_="%{$fg[white]%}{%{$fg[yellow]%}%D{%d/%m, %H:%M}%{$fg[white]%}}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# PROMPT='$ZOV_CURRENT_TIME_ %n@%m in %{$fg[green]%}%~%{$reset_color%} $(git_prompt_info)%# '
PROMPT='%n@%m in %{$fg[green]%}%~%{$reset_color%} $(git_prompt_info)%# '

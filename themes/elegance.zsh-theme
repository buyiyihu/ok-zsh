local return_code="%(?..%{%B$fg[red]%}%? ↵%b%{$reset_color%})"

PROMPT='$(virtualenv_prompt_info)%{[03m%}%{%F{22}%}%c \
$(git_prompt_info)\
\
%{%F{232}%}%(!.#.>)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='%{%F{238}%}%~%{$reset_color%} ${return_code} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{%F{103}%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{%F{103}%}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$reset_color%}%{$fg[cyan]%}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="!%{$reset_color%} "
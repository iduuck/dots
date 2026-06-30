# Set terminal title: shows "cwd-basename" at prompt, "command | cwd-basename" while running
function _set_title_idle() {
  print -Pn '\e]2;%1~\a'
}

function _set_title_running() {
  local cmd="${1%% *}"
  print -Pn "\e]2;${cmd} | %1~\a"
}

autoload -Uz add-zsh-hook

add-zsh-hook precmd _set_title_idle
add-zsh-hook preexec _set_title_running

# 補完機能
autoload -Uz compinit
compinit

#直前のコマンドと同じなら、履歴に残さない
setopt HIST_IGNORE_DUPS

#補完のリストの、選択している部分を塗りつぶす
zstyle ':completion:*' menu select

# lsとllコマンドの設定
alias ls='ls -FG'
alias ll='ls -alFG'

# 色を使用出来るようにする
autoload colors
colors

#ターミナルの表示をディレクトリ名だけに変更
#見本

#PROMPT="%{${fg[red]}%}%n@%{${reset_color}%} %~  
#$ " 

#PROMPT='%n@%~
#$ '
#RPROMPT="%{${fg[red]}%}%t [%h]%{${reset_color}%}"


autoload -Uz vcs_info
setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '!'
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:*' formats ' %c%u(%s:%b)'
zstyle ':vcs_info:*' actionformats ' %c%u(%s:%b|%a)'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

PROMPT="%F{red}%1(v|%1v|)%f%b %F{blue}%~%f
%F{red}❯%f "
RPROMPT="%{${fg[red]}%}%t [%h]%{${reset_color}%}"

# 下線付きの空白文字が表示される
print -P '%U${(r:COLUMNS:: :)}%u'
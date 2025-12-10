function kube_prompt_info() {
  # get current context and namespace
  local context namespace
  context=$(kubectx -c 2>/dev/null)
  namespace=$(kubens -c 2>/dev/null)

  # don´t show anything if neither is present
  if [[ -z "$context" && -z "$namespace" ]]; then
    return
  fi

  # Fallback if namespace is not seet
  if [[ -z "$namespace" ]]; then
    namespace="N/A"
  fi

  if [[ -d .terraform ]]; then
    tf_ws="%{$fg[blue]%}/%{$fg[white]%}tf-ws:$(tf workspace show)"
  fi
  
  
  echo "%{$fg[blue]%}(%{$fg[yellow]%}⎈kx:$context%{$fg[blue]%}/%{$fg[red]%}kn:$namespace$tf_ws%{$fg[blue]%})%{$reset_color%}"
}

function mic_colors() {
  echo "%{$fg[cyan]%}❯%{$fg[red]%}❯%{$fg[yellow]%}❯%{$fg[green]%}❯%{$reset_color%}"
}

PROMPT=$'%{$fg_bold[green]%}%n%{$fg_bold[green]%} %{$fg[cyan]%}%3~ $(kube_prompt_info) %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}% %{$reset_color%}\n$(mic_colors) '

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# some testings and play-arounds
#echo -e "git_prompt_info:  $(git_prompt_info)" 
#echo -e "parse_git_dirty:  $(parse_git_dirty)" 
#echo -e "git_remote_status:  $(git_remote_status)" 
#echo -e "git_current_branch:  $(git_current_branch)" 
#echo -e "git_commits_ahead:  $(git_commits_ahead)" 
#echo -e "git_commits_behind:  $(git_commits_behind)" 
#echo -e "git_prompt_ahead:  $(git_prompt_ahead)" 
#echo -e "git_prompt_behind:  $(git_prompt_behind)" 
#echo -e "git_prompt_remote:  $(git_prompt_remote)" 
#echo -e "git_prompt_short_sha:  $(git_prompt_short_sha)" 
#echo -e "git_prompt_long_sha:  $(git_prompt_long_sha)" 
#echo -e "git_prompt_status:  $(git_prompt_status)" 
#echo -e "git_current_user_name:  $(git_current_user_name)" 
#echo -e "git_current_user_email:  $(git_current_user_email)" 
#echo -e "git_repo_name:  $(git_repo_name)" 

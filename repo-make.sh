. ./shflags.sh

DEFINE_boolean 'private' false 'Set the repo to private on creation - only works if you have private repo rights' 'p'
DEFINE_string 'repo_name' '' 'Set the name for the repo to be created on github (Required)' 'n'
DEFINE_boolean 'remote_link' false 'Link the created remote repo to the repo in the current working directory' 'r'
DEFINE_string 'github_user' '' 'Your github username (Required)' 'u'

die()
{
  [ $# -gt 0 ] && echo "error: $@" >&2
  flags_help
  exit 1
}

FLAGS "$@" || exit 1
eval set -- "${FLAGS_ARGV}"

if [ ${FLAGS_private} == 0 ]
  then
  private=true
  else
  private=false
fi

if [ ${FLAGS_repo_name} == '' ] || [ ${FLAGS_github_user} == '' ]
  then
  die
  else
  repo_name=${FLAGS_repo_name}
  github_user=${FLAGS_github_user}
fi

CURL_COMMAND="curl -H \"X-content-type: application/json\" -u ${github_user} \
    -X POST --data-binary \"{\\\"name\\\": \\\"${repo_name}\\\", \\\"private\\\": \\\"${private}\\\"}\" \"https://api.github.com/user/repos\""

eval $CURL_COMMAND

if [ ${FLAGS_remote_link} == 0 ]
  then
    REMOTE_ADD="git remote add origin \"https://github.com/${github_user}/${repo_name}.git\""
    eval $REMOTE_ADD
    echo "Remote added, use git push -u origin master to push your local repo to github"
  else
    exit 0
fi

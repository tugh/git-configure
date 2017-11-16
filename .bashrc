function git_config_check() {
    if [ -a .git ]
    then
        if [[ -z `git config --local user.name` ]] || [[ -z `git config --local user.email` ]]
        then
            git_config_profile_select
        fi
    fi
}

function git_config_profile_select() {
    echo Select one of the listed profiles
    echo "[1] github"
    echo "[2] gitlab"
    echo "[3] some_other_git_server"
    read -p "[1-3] " answer

    if [ $answer -eq 1 ]
    then
        git config --local user.name John # write your own name
        git config --local user.email john@github.com # write you own email
    elif [ $answer -eq 2 ]
    then
        git config --local user.name John # write your own name
        git config --local user.email john@gitlab.com # write you own email
    elif [ $answer -eq 3 ]
        git config --local user.name John # write your own name
        git config --local user.email john@example.com
    fi

    echo Your current configs are:
    echo user.name `git config --local user.name`
    echo user.email `git config --local user.email`
}

alias cd='function __cd() { cd $1 && git_config_check; unset -f __cd; }; __cd'

vi /etc/bash_completion
or
vi /usr/share/bash-completion/bash_completion
or
/etc/bash_completion.d/apport_completion (in ubuntu)

######Below are the bash completion for the version before 3.X

# s2(1) completion
#
_login_s2()
{
    node_file=~/nodes
    if [ -f  $node_file ];then
        local pre cur opts
        COMPREPLY=()
        pre=${COMP_WORDS[COMP_CWORD-1]}
        cur=${COMP_WORDS[COMP_CWORD]}
        if [ $pre == "./s2" -o  $pre == "s2" ]; then
            opts="-c CLIs \n"`cat $node_file | grep -vE "^#" | awk -F ',' '{if($1!=" ")print $1}' | awk BEGIN{RS=EOF}'{gsub(/\n/," ");print}'`
            COMPREPLY=( $( compgen -W "$opts" -- $cur ) )
        fi
    fi
}
complete -F _login_s2 $filenames s2



###Below are the bash completion for the latest version 3.X

# s2(1) completion
#
_login_s2()
{
    node_file=~/nodes
    if [ -f  $node_file ];then
        local pre cur opts
        local node_name_list=(`cat $node_file | grep -vE "^#" | awk -F ',' '{if($1!=" ")print $1}' | awk BEGIN{RS=EOF}'{gsub(/\n/," ");print}'`)
        COMPREPLY=()
        pre=${COMP_WORDS[COMP_CWORD-1]}
        cur=${COMP_WORDS[COMP_CWORD]}
        if [ "$pre" == "./s2" -o "$pre" == "s2" ]; then
            opts="-c "${node_name_list[*]}
            COMPREPLY=( $( compgen -W "$opts" -- $cur ) )
        elif [ `cat "$node_file" | grep -wEc "^$pre"` -eq "1" ];then
            opts="-c "
            COMPREPLY=( $( compgen -W "$opts" -- $cur ) )
        else
            opts="-c "${node_name_list[*]}
            COMPREPLY=( $( compgen -W "$opts" -- $cur ) )
        fi
    fi
}
complete -F _login_s2 $filenames s2



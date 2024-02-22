# This is the .bashrc file for the msys distro


export PATH=$PATH:/c/sw/nodejs

# setup ssh-agent and prevent multiple instance
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

registerSSH() {

    # agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
    agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

    if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
        agent_start
        ssh-add -t 600 ~/.ssh/personal
    elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
        ssh-add -t 600 ~/.ssh/personal
    else
        echo "SSH STILL VALID"
    fi
}

registerSSH

unset env

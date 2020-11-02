if [ -z "$PS1" ]; then return; fi

last_server_id=""

nike() {
        ssh bnelson@nike.cs.uga.edu
}

rmd() {
	pandoc $1 | lynx -stdin
}

unmount() {
    umount ~/mount/*
}

unmount_nike() {
    umount ~/mount/nike
}

unmount_pi() {
    umount ~/mount/pi
}

mount_nike() {
    if [ $? -eq 0 ]; then
        remote_path=$1
    else remote_path="/home/ugrads/bnelson"
    fi
    general_mount bnelson@nike.cs.uga.edu:/$remote_path ~/mount/nike
}

mount_pi() {
    if [ $# -eq 1 ]; then
        remote_path=$1
    else remote_path="/home"
    fi
		ip=$(curl -s https://api.ipify.org)
    general_mount pi@$ip:/$remote_path ~/mount/pi
}

general_mount() {
    sshfs $1 $2 -o follow_symlinks,reconnect,ServerAliveInterval=15,ServerAliveCountMax=3
}

pi() {
	ip=$(curl -s https://api.ipify.org)
        ssh pi@$ip
}

vcf() {
   ssh -t bnelson@nike.cs.uga.edu ssh -t vcf0
}

vcf_screen() {
    ssh -t bnelson@nike.cs.uga.edu ssh -t vcf0 screen -r
}

webserver() {
    if [ $# -ne 2 ] && [ $# -ne 0 ]; then 
        echo "USAGE webserver [port #] [directory_to_open]"
        echo "OR defaults are port = 5000 directory = ."
        return 1;
    fi 

    if [ $# -ne 0 ]; then web=$1; dir="$2"
    else web=5000; dir="."
    fi

    echo "Starting webserver on port $web" 
    python -m http.server $web > /dev/null 2>&1 &
    last_server_id=$!
    echo "The pid of the server is: $last_server_id"
}

webserver_stop() {
    kill $last_server_id
    last_server_id=""
}

scptocmu() {
	klist -s || kinit -k -t ~/keytab baileyn@ANDREW.CMU.EDU > /dev/null
	scp $1 cmu:~/private/$2
}

scpfromcmu() {
	klist -s || kinit -k -t ~/keytab baileyn@ANDREW.CMU.EDU
	scp cmu:~/private/$1 $2
}

cmu() {
	klist -s || kinit -k -t ~/keytab baileyn@ANDREW.CMU.EDU
	ssh cmu
}

shark() {
	sharks=("angel" "bamboo" "basking" "blue" "carpet" "cat" "hammerhead" 
		"hound" "lemon" "mako")
	index=$(($RANDOM % ${#sharks[@]}))
	shark=${sharks[$index]}shark.ics.cs.cmu.edu
	echo $shark
	ssh -o GSSAPIAuthentication=yes -o GSSAPIDelegateCredentials=yes baileyn@${sharks[$index]}shark.ics.cs.cmu.edu
}

ctf() {
	expect -c 'spawn ssh -D 8123 -C -q -N tunneler@ctf.ini.cmu.edu; expect "assword:"; send "inictf2020iirc!\r"; interact'
}

alias mr="make run"
#alias python="/usr/local/bin/python3"
#alias pip="/usr/local/bin/pip3"
#alias vi="/usr/local/bin/mvim -v"
#alias vim="/usr/local/bin/mvim -v"
alias ..="cd .."
alias ll="ls -la"

#export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-12.0.1.jdk/Contents/Home"
export JAVA_HOME=`/usr/libexec/java_home`
export PATH_TO_FX="/Library/Java/JavaVirtualMachines/JavaFX/lib"
export PATH=$PATH:/Users/baileynelson/bin #Add my bin to the path
export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/baileynelson/Library/Python/2.7/bin:$PATH"
#export PATH="/usr/local/bin:$PATH"
#export PATH="/usr/local/opt/mysql@5.7/bin:$PATH" #Adding mysql
#export PATH=/usr/local/opt/krb5/bin:$PATH
#export PATH=/usr/local/opt/krb5/sbin:$PATH

#set -o vi

trash() {
    mv $@ ~/.Trash
}
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '

source /usr/local/Cellar/zsh-autosuggestions/0.6.4/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#bindkey '^M' autosuggest-execute #c-enter

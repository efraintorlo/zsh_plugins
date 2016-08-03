
alias odriveagent='nohup odriveagent > /dev/null &'
alias odrivesyncall='for i in *.cloud; do odrive sync $i; done'
#alias odriveunsyncall='for i in find . -maxdepth 1 -type f; echo "HELLO $i"; done'
#alias odriveunsyncall='find . -maxdepth 1 -type f | xargs echo "HELLO"'

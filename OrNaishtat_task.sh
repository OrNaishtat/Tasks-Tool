#! /bin/bash
###################################################
# Author: NewLight (Or Naishtat)
# Version: 0.1
# Purpose: Check candidate initial knowledge with linux systems.

# Task 1 - Write a command or script that will perform a file rename for all files ending with '.ext' to the same filename ending with '.newext"

# Task 2 - Please write a command or a script that will use the output of 'ps aux' and show the:
# + Total amount of CPU used
# + Total amount of CPU used by non-root users

# Task 3 - the file /etc/ssh/sshd_config was changed on the machine. Which command should be ran in order to apply the changes to the running service?

# Task 4 - Please write a script or command to show which RPM package contains the file '/bin/bash'

# Task 5 - Please write a command or a script to the machine's distribution type, version, and kernel version.
###################################################

## Variables ##
deco_line='#######################################################'
deco_time=3
################

function task_1(){
for f in *.ext; do mv "$f" "$(echo "$f" | sed s/ext/newext/)"; done
}

function task_2(){
echo "Total %CPU used:"
ps aux | awk '{total+=$3;print total}' | tail -n 1
echo "Total %CPU used by non-root users:"
ps aux | grep -v root |  awk '{total+=$3;print total}' | tail -n 1
}

function task_3(){
echo "The question is: "
echo "The file /etc/ssh/sshd_config was changed, which command should you run to apply changes to the running service?"
echo "answer in 3 seconds..."
sleep $deco_time
echo "sudo service sshd restart"
}

function task_4(){
rpm -qf /bin/bash

}

function task_5(){
hostnamectl | grep "Operating System"
hostnamectl | grep "Kernel"
}

## User Interaction ##
function tasks(){
echo $deco_line
echo "Task 1 - Write a command or script that will perform a file rename for all files ending with '.ext' to the same filename ending with '.newext"
echo "Task 2 - Please write a command or a script that will use the output of 'ps aux' and show the:"
echo "Total amount of CPU used"
echo "Total amount of CPU used by non-root users"
echo "Task 3 - the file /etc/ssh/sshd_config was changed on the machine. Which command should be ran in order to apply the changes to the running service?"
echo "Task 4 - Please write a script or command to show which RPM package contains the file '/bin/bash'"
echo "Task 5 - Please write a command or a script to the machine's distribution type, version, and kernel version."
echo $deco_line
read -p "Which task would you like to check? (1-5) " task_id
task_$task_id
}
tasks
while true; do
    read -p "Would you like to check another task? y/n " yn
    case $yn in
        [Yy]* ) tasks;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done



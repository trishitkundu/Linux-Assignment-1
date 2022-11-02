#!/bin/bash

#XXXXXX-------XXXXXXXXXX--------XXXXXXXXXXXX--------XXXXXXXXXXXX----------XXXXXXXXXXXXX---------XXXXXXXXX---------
#Name-Trishit Kundu Roll-1928327

#Algorithm && Program Description:-

#This program is the life cycle of xclock.
# At first we are taking a command line argument by passing the process in this program.  
# The processes includes 1 for starting the program 2 for stopping ther program 
#3 for restarting the stopped program 4 for reloading the process 5 for killing the process and
#6 for checking the status of the process.
#Here we are running the process by calling a function clock in which various job process commands are inside case
#and on successfull giving the process the job starts and saving the current process id in file and then start, update, kill
#reload and finally storing status in text file.
#if no command will pass then it is showing the menu

#XXXXXXX-------XXXXXXXXXX--------XXXXXXXXXXXX--------XXXXXXXXXXXX----------XXXXXXXXXXXXX---------XXXXXXXXX---------
d=0
clock()		#function starts
{
case "$1" in		#case starts when the process is given in commandline

start)		xclock -update 1 & 		#gets the time from the system clock, then displays in a digital clock.
		pgrep -n xclock > pid.txt	#storing the current process id in a file.
		echo "Process started successfully..." > t.txt		#output redirected to file
		cat t.txt
		while read -r line 		# reading the current process id from file
		 do
         d+=$line
		 done < pid.txt;;				#reading the file

stop)	while read -r line 		# reading the current process id from file
		 do
         d+=$line
		 done < pid.txt
		 kill -19 $d 			#SIGSTOP (Stopping the process)
		echo "Process is stopped..." > t.txt
		cat t.txt;;

restart) while read -r line 	# reading the current process id from file
		 do
         d+=$line
		 done < pid.txt
		 kill -18 $d 			#SIGCONT (Resuming the stopped process)
		echo "Process is restarted..." > t.txt
		cat t.txt;;

reload)	while read -r line 			# reading the current process id from file
		 do
         d+=$line
		 done < pid.txt
		 kill -9 $d 		
			xclock -update 1 &		#reloading the process
			pgrep -n xclock > pid.txt
			echo "Process is reloaded successfully." > t.txt
		cat t.txt;;

kill) 	while read -r line 		# reading the current process id from file
		 do
         d+=$line
		 done < pid.txt
		 kill -9 $d 		#SIGKILL (Terminating immediately)
		echo "Process is killed successfully." > t.txt
		cat t.txt;;

status)	while read -r line		#Reading from the file
		do
		echo $line				#Printing the status
		done < t.txt;;

*)		echo "Usage of $0 requires [start] | [stop] | [restart] | [reload] | [kill] | [status]"
		echo "No process is running..." > t.txt
		exit;;
esac
}
clock $1		#function ends
printf '\n' 
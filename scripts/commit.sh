echo -e "\nwhat type of commit is this?"
echo -e "\t1: docs"
echo -e "\t2: addition"
echo -e "\t3: fix"
echo -e "\t4: refactor"
echo -e "\t5: override"

read option

create_message() {
	echo -e "[$(date +%m/%d)] $type\n" >| ~/.gitmessage.txt
	git commit
	git push
}

if [ $option -eq "1" ]; then
	type="docs: "
	create_message
elif [ $option -eq "2" ]; then
	type="addition: "
	create_message
elif [ $option -eq "3" ]; then
	type="fix: "
	create_message
elif [ $option -eq "4" ]; then
	type="refactor: "
	create_message
elif [ $option -eq "5" ]; then
	echo -e "[$(date +%m/%d)] " >| ~/.gitmessage.txt
	git commit
	git push
else 
	exit 1
fi


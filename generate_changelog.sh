echo "Generate a CHANGELOG"
echo "By comparing 2 branches"
echo "Using a timespan (YYYY-MM-DD)"

select option in "branch" "date" "exit"; 
do
	case $option in
		branch )  
		echo "First branch:"
		read b1
		echo "Second branch:"
		read b2
		git log $b1...$b2 --pretty=tformat:"* %s" > CHANGELOG.md; break;;
	date )
		echo "Date from:"
		read d1
		echo "Date to:"
		read d2
		git log --since=$d1 --until=$d2 --pretty=tformat:"* %s" > CHANGELOG.md; break;;
	exit ) exit;;
	esac
done

wordpad CHANGELOG.md
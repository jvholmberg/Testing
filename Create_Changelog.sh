echo "Create CHANGELOG using"
echo "compare 2 branches (Name)"
echo "compare between 2 dates (YYYY-MM-DD)"

select option in "branch" "date" "exit"; 
do
    case $option in
        branch )  
            echo "Compare from:"
            read b1
            echo "Compare to:"
            read b2
            git log $b1...$b2 > CHANGELOG.md --pretty=format:'* %s'; break;;
	date )
            echo "Date from:"
            read d1
            echo "Date to:"
            read d2
            git log --since=$d1 --until=$d2 > CHANGELOG.md --pretty=format:'* %s'; break;;
        exit ) exit;;
    esac
done
# Version 1.0.0

# Prerequisties: You are required to have the branch -es downloaded and up to date
# for this script to work.

echo "Create Releasenotes using"
select option in "compare" "date" "exit"; do case $option in
	compare )
		# Generate Releasenotes by comparing 2 branches and open in Wordpad  
		echo "Create log by comparing branches:"
		echo "Base branch:"
		read branch1
		echo "Compare with:"
		read branch2
		git log $branch1...$branch2 --left-only --format="* %s" > RELEASENOTES.md; break;;
	date )
		# Generate Releasenotes using commits in current branch and open in Wordpad  
		echo "Create log beginning from (YYYY-MM-DD):"
		read sinceDate
		git log --first-parent --since=$sinceDate --format="* %s" > RELEASENOTES.md; break;;
	exit ) exit;;
	esac
done
wordpad RELEASENOTES.md
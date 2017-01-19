#!/bin/bash

TESTS=`find ./tests_runs -maxdepth 1 -type f`

# Run each test
for TEST in $TESTS
do
	TEST=`basename $TEST`
	echo "Starting test $TEST..."

	# Run the test script
	sh "./tests_runs/$TEST" > "./tests_actual/$TEST.txt"

	# Compare its output with the expected output
	diff "./tests_expected/$TEST.txt" "./tests_actual/$TEST.txt"
	if [ $? -eq 1 ]
	then
		echo "DIFFERENCES FOUND WHILE RUNNING TESTS"
		exit 1
	fi
done

echo "Successfully completed all tests! Congrats! 🎉"

exit 0

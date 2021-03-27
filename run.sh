#!/bin/bash

dir="$(dirname $0)"
main="$dir/../main.py"

function run_test {
    rm -rf output
    inputfile="$dir/tests/$1"
    outputfile="$(dirname $inputfile)/$(basename $1 .in).out"
    echo $outputfile
    echo Running $inputfile
    python3 $main < $inputfile > output
    ERROR=0
    if ! diff output $outputfile -b --side-by-side > error;
    then
        echo "Your output                                           | Correct output"
        cat error
        ERROR=1
    else
        echo Correct
    fi
    rm -rf output
    rm -rf error
    return $ERROR
}

if [ $# -lt 1 ];
then
    echo "Running all tests"
    for folder in "$(cd $dir && find tests -type d -mindepth 1 -maxdepth 1)"
    do
        echo $folder
        for file in ""$(cd $dir/tests && find . -type f -name '*.in' -mindepth 1 -maxdepth 2)""
        do
            echo file $file
            run_test $file
        done
    done
else
    run_test $1
fi 
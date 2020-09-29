#!/bin/bash 
##########################################################################
# Name:         parser.sh
# Description:  Parser for headers.  This is a preliminary implementation
#               of a parser we can use to describe a file in the project.  
#               The intent is to be able to parse a comment header such as
#               this one.  This is the hard way to do it, of course.  An 
#               easier approach would be to use an associative array or 
#               other such easy-to-"parse" structure for the metadata.
#               Also note the current version fails on THIS header. :(
# Usage:        parser.sh <filename>
##########################################################################

filename=$1

parse_token() {
    name=$1
    output=$(grep -i "^\# ${name}.*" $filename)
    echo $output
    # echo "HEADER_name = $HEADER_name"
}
declare -A metadata

parse_tokens() {
    # Notes are optional
    tokens=(Name Description Usage Notes)
    token_regexp="# [Name:|Description:|Usage:|Notes:]"
    echo "Parsing tokens:  ${tokens[@]}"

    found_start=0
    while read line
    do
        # Start when we hit the start of the file comment block, and 
        # stop when we get to the end of the file comment block.
        if echo $line | grep "^##.*" > /dev/null; then
            if [ $found_start != 0 ]; then
               break
            fi
            found_start=1
            continue
        fi
        
        if [ $found_start != 0 ]; then
            if echo $line | grep "${token_regexp}" > /dev/null; then        
                for token in ${tokens[@]}; do
                    if echo $line | grep ${token} > /dev/null ; then
                        last_token=${token}
                        metadata[${token}]=$(echo $line | sed 's/# '${token}': //g')
                    fi
                done
            else
                # echo Line found
                if [[ -n "$last_token" ]]; then
                    continuation=$(echo $line | sed 's/# //g')
                    metadata[${last_token}]="${metadata[${last_token}]} $continuation"
                fi
            fi 
        fi
        done < $filename;

    for token in ${tokens[@]}; do
        if [[ -n "${metadata[${token}]}" ]]; then
            echo "${token}: ${metadata[${token}]}"
        fi
    done

}
    
parse_tokens


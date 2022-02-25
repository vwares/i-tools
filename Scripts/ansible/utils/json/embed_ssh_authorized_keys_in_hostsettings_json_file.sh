#!/bin/bash
# Check syntax
if [ -z "$2" ]; then
  echo "Syntax : $0 [input keys dir] [input json file] [username] [[outfile path]]"
  exit
fi

# Set variables
export inputkeysdir="$1" # e.g "/etc/ssh"
export inputjsonfile="$2" # e.g "template.json"
export outputusername="$3" # e.g "john"
if [ -z "$4" ]; then
  export outputjsonfile="/dev/stdout"
else
  export outputjsonfile=$4
fi

# Check input directory path
if [ ! -d "$inputkeysdir" ]; then
  echo "directory not found : $inputkeysdir"
  exit
fi

# Check input file path
if [ ! -f "$inputjsonfile" ]; then
  echo "file not found : $inputjsonfile"
  exit
fi

# Get original json value
export outputjson=`cat "$inputjsonfile"`

# Get keys values and add newline (= $'\n')
for FILE in "$inputkeysdir"/*
do
  export authkeyscontent=$authkeyscontent`cat "$FILE"`$'\n'
  echo Processed $FILE
done

# Replace value in outputjson variable
export outputjson=`echo $outputjson | jq '.users |= map(if .name == env.outputusername then .authorized_keys = env.authkeyscontent else . end)'`

# Export modified json content to specified file
echo $outputjson | jq . > "$outputjsonfile"

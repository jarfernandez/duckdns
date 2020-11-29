#!/bin/bash

# Export the variables in the ~/duckdns/conf/update-duckdns.conf file
export $(egrep -v '^#' ~/duckdns/conf/update-duckdns.conf | xargs)

# Replace %$ with whitespace
export DATE_FORMAT_LOG="${DATE_FORMAT_LOG//%$/ }"

# Replace ~ character with home directory
export OUTPUT_TEMP_FILE="${OUTPUT_TEMP_FILE/\~/${HOME}}"
export UPDATE_DUCKDNS_LOG="${UPDATE_DUCKDNS_LOG/\~/${HOME}}"

curl -k "https://www.duckdns.org/update?domains=${DOMAINS}&token=${DUCKDNS_TOKEN}&ip=&verbose=true" > ${OUTPUT_TEMP_FILE} 2> /dev/null

output=$?
first_line=$(head -1 ${OUTPUT_TEMP_FILE})
if [[ $output -ne 0 || $first_line != "OK" && $first_line != "KO" ]]
then
  echo "$(date +"${DATE_FORMAT_LOG}") ERROR"
  exit 1
fi

log_entry=""
for word in $(cat ${OUTPUT_TEMP_FILE})
do
  log_entry="${log_entry}${word} "
done
rm -f ${OUTPUT_TEMP_FILE}

echo "$(date +"${DATE_FORMAT_LOG}") ${log_entry}" >> ${UPDATE_DUCKDNS_LOG}


#!/bin/bash
MAXFSIZE="1" #unit kb
TEXTTYPE="ASCII text"
#
function LargeOrNot {
  local filepath="${1%/}"
  if [ -n "$MAXFSIZE" ] && [ "$MAXFSIZE" -eq "$MAXFSIZE" ] 2>/dev/null; then #check if $MAXFSIZE is a number
    local qattr=$(( $MAXFSIZE * 1024 )) #conver to bytes
    local filesize=$(du -b $filepath 2>/dev/null |cut -f1  2>/dev/null)
    local filetype=$(file $filepath)
    if [ -z $filesize ]; then filesize=0; fi
    if [[ $filesize -gt $qattr ]] && [[ ! "$filetype" == *"$TEXTTYPE"* ]]; then
      if_large=true
    fi
  else
    echo "Bad MAXFSIZE setting" >&2
    if_large=true # set to true and let users handle it
  fi
}

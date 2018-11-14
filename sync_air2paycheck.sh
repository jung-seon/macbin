#! /usr/bin/env bash

d=$( echo $( date +%d ) % 3 | bc )
td=$( date +%m%d )
filename=MacAir_bin_$( echo $d )_.tar.gz

tar -czf /tmp/$filename ~/bin/. 2>/dev/null 1>&2 

if [ $? -eq 0 ] && [ -f /tmp/$filename ]; then 
    rsync /tmp/$filename paycheck: 2> /dev/null
    if [ $? -eq 0 ] ; then
        touch /tmp/SUCCESS_SYNC_paycheck_$td
    else
        touch /tmp/FAILURE_SYNC_paycheck_$td
    fi
    ismnt=$( ssh paycheck "if [ -f /mnt/$filename ] ; then echo 0 ; fi " )
    if ! [ -z "$ismnt"  ] ; then 
        rsync /tmp/$filename paycheck:/mnt/$filename 
        touch /tmp/SUCCESS_SYNC_paycheck_mnt_$td
    else
        touch /tmp/NOT_MOUNTED_PAYCHECK_MNT_$td
    fi
fi

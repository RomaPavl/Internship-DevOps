#!/bin/bash

completed=$( grep -c "Finished Install" ./softaculous.log )
finished=$( grep -c "Finished Remove" ./softaculous.log )

echo "Installed processes $completed"
echo "Finished processes $finished"

grep -oP "'(?:softdbpass|admin_pass)'\s*=>\s*'\K[^']+" ./softaculous.log | sort -u | while read -r password; do
    if [[ ${#password} -ge 12 ]] &&
       [[ $password =~ [a-z] ]] &&
       [[ $password =~ [A-Z] ]] &&
       [[ $password =~ [0-9] ]] &&
       [[ $password =~ [\!\@\#\$\%\^\&\*] ]]; then
        echo "Good"
    else
        echo "This $password not valid"
    fi
done







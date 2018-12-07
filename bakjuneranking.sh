rank=$( curl -s 'https://www.acmicpc.net/user/duplexlinea' | grep  '<td>' | awk '{if(NR ==1) print ;}' | sed 's/<.*>\(.*\)<\/.*>/\1/;s/[:blank:]//g' )
d=$( date +%Y%m%d )
echo $d $rank >> /home/jungseon/bin/mybakjunerank.txt
echo $d $rank >> /mnt/mybakjunerank.txt

#| tr -d '[:blank:]' )

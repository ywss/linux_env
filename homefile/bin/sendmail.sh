#!/bin/bash
send_mail()
{

d=`date`
d2=`date "+%Y-%m-%d %H:%M"`
(
sleep 1
echo "ehlo snda.com" 
sleep 1
echo "auth login"
sleep 1
echo "eHV4aWFvcm9uZ0BzbmRhLmNvbQ=="
sleep 1
echo "YW4hd25USk0="
sleep 1
echo "MAIL FROM:${1}" 
sleep 1
echo "RCPT TO:${2}"
sleep 1
echo "Data"
sleep 1
echo "From:${1}"
echo "To:${2}"
echo "Date: $d"
echo "Subject: testmessage $d2"
echo "Mime-Version: 1.0"
echo "Content-Type: text/plain; "
echo "  charset=utf-8"
echo "Content-Transfer-Encoding: base64"
echo ""
echo "${3}"
echo ""
echo "."
sleep 2
echo "QUIT" ) | telnet ${4} ${5}
}
rm -rf /tmp/a.log

echo "hi, " > /tmp/a.log
echo " "
echo " "
echo " " >> /tmp/a.log
echo "-------------------------------------------"  >> /tmp/a.log
#statistic yesterday 
d3=`date -d yesterday +%Y%m%d`
b=`base64 /tmp/a.log`

send_mail "xuxiaorong@snda.com" "amail2011@126.com" "$b" "smtp.snda.com" "25"
send_mail "xuxiaorong@snda.com" "amail2011@126.com" "$b" "smtp.snda.com" "25"
send_mail "xuxiaorong@snda.com" "amail2011@126.com" "$b" "smtp.snda.com" "25"
send_mail "xuxiaorong@snda.com" "amail2011@126.com" "$b" "smtp.snda.com" "25"
send_mail "xuxiaorong@snda.com" "amail2011@126.com" "$b" "smtp.snda.com" "25"
send_mail "xuxiaorong@snda.com" "amail2011@126.com" "$b" "smtp.snda.com" "25"
send_mail "xuxiaorong@snda.com" "amail2011@126.com" "$b" "smtp.snda.com" "25"
send_mail "xuxiaorong@snda.com" "amail2011@126.com" "$b" "smtp.snda.com" "25"
send_mail "xuxiaorong@snda.com" "amail2011@126.com" "$b" "smtp.snda.com" "25"
send_mail "xuxiaorong@snda.com" "amail2011@126.com" "$b" "smtp.snda.com" "25"
send_mail "xuxiaorong@snda.com" "amail2011@126.com" "$b" "smtp.snda.com" "25"
send_mail "xuxiaorong@snda.com" "amail2011@126.com" "$b" "smtp.snda.com" "25"
send_mail "xuxiaorong@snda.com" "amail2011@126.com" "$b" "smtp.snda.com" "25"
send_mail "xuxiaorong@snda.com" "amail2011@126.com" "$b" "smtp.snda.com" "25"
send_mail "xuxiaorong@snda.com" "amail2011@126.com" "$b" "smtp.snda.com" "25"


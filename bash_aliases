#Server Start
alias webstart="su -c 'service httpd start && service mysqld start'"
#Server Stop
alias webstop="su -c 'service httpd stop && service mysqld stop'"
#Drush alias
alias drush='/opt/drush/drush'

#Checkout Drupal from CVS
alias checkouthead='cvs -z6 -d:pserver:anonymous:anonymous@cvs.drupal.org:/cvs/drupal checkout -d www/html/drupal_head/ drupal'
#Checkout Drupal 6 from CVS
alias checkout6='cvs -z6 -d:pserver:anonymous:anonymous@cvs.drupal.org:/cvs/drupal co -r DRUPAL-6 -d www/html/drupal_6/ drupal'

#enable prompt before removal/overwritten of files/folders
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

#Colored Grep
alias grep="grep --color=auto"

#Better History
shopt -s histappend
PROMPT_COMMAND='history -a'

#MAC Command Equivalents
#pbcopy
alias pbcopy='xsel --clipboard --input'
#pbpaste
alias pbpaste='xsel --clipboard --output'
#say
alias say='festival'

#Python Server
alias pyserv='python -m SimpleHTTPServer 8000'
#Top top
alias ltop='top -F -R -o cpu'

#Get list of network IPs
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+)/ && print $1'"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias flush="su -c 'service dnsmasq restart'"

#dirstat - Resource consuming
alias dirstat='du -s ./* | sort -n | cut -f 2- |xargs -i du -sh {}'

#look into complete
#Also look into bcat
#http://github.com/rtomayko/bcat
#Look into autojump
#http://wiki.github.com/joelthelion/autojump
# grep "is needed" | sed 's/^[ \t]\+//g'| awk '{print $1}' | sed -e :a -e '$!N;s/\n/ /;ta'

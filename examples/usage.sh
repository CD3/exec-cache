script usage.transcript
export PS1="$ "
mkdir testing
cd testing
exec-cache-setup
ls
source exec-cache.d/exec-cache-setup-env
date
sleep 2
# pause 20
date
which date
exec-cache-wrap date
hash -r
which date
date
sleep 2
# pause 20
date

exit

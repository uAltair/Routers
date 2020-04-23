1.Add line to cron:
*/2 * * * * sleep 70 && touch /etc/banner &&/usr/share/watchdog.sh
2. Set watchdog.sh to /usr/share/
3. Make cmode -x /usr/share/watchdog.sh

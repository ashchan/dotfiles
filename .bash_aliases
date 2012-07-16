alias fix_ios_simulator="launchctl list|grep UIKitApplication|awk '{print $3}'|xargs launchctl remove"

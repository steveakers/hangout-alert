### NAME

**hangout-alert** - Uses Apple Notification Center to provide the hangout link for an upcoming meeting. Original
idea by Muness as documented on [his blog](http://muness.blogspot.com/2013/06/life-hack-gcal-im-reminders.html).

###DESCRIPTION

**hangout-alert** If you subscribe to a Google calendar using Apple's Calendar app, you know that hangout links will
not show up a meeting request. So even though Calendar will remind you of the meeting, you have to log into Google
calendar to find the link. That's where hangout-alert comes in. This script uses gcalci to grab your agenda for the
day and then uses terminal-notifier to generate an Apple notification that presents the hangout link in the "show"
button. Simple click that button and join the hangout.

###INSTALLATION

1. Install Muness' [fork of gcalci](https://github.com/muness/gcalcli)
2. Authorize gcalci by launching it
3. Install [terminal-notifier](https://github.com/alloy/terminal-notifier)
4. Clone this repo, tweak to your liking, and copy hangout-alert.rb to /some/path/hangout-alert
5. Setup a cron job to run the script (e.g. 13,28,43,58  8-18  *  *  *  /some/path/hangout-alert)

In my example cron job in step 4 I'm running the script every day from 8am to 6pm, 2 minutes before the quarter hour.
The idea is that most meetings will start on a quarter hour, and the 10 minute default alert I get from Calendar is
generally to far in advance (I always forget in about 5 minute.) 

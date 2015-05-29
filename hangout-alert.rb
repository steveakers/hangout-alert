#!/usr/bin/ruby

require 'time'

meetings = `/usr/local/bin/gcalcli agenda --tsv --details all`

meetings.force_encoding("UTF-8").split("\n").each do |line|
  row = line.split("\t")

  title   = row[6]
  start   = Time.parse(row[0] + " " + row[1])
  details = row[4]
  hangout = row[5]

  time = Time.now
  link = hangout.length > 0 ? "#{hangout}" : "#{details}"
  msg = hangout.length > 0 ? "Hangout" : "Meeting"

  if time <= start && time >= start - (5 * 60) 
    `terminal-notifier -message '#{msg} starts at #{start.strftime('%l:%M')}.' -title '#{title}' -open '#{link}' -sound 'Basso'`
  end

end

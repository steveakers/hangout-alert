#!/usr/bin/ruby

require 'time'
require 'optparse'

# default options
minutes_before_meeting  = 5

ARGV.options do |opts|
  opts.on("-m", "--minutes_before_meeting=val", Integer)  { |val| minutes_before_meeting = val.to_i }
  opts.parse!
end

puts minutes_before_meeting

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

  if time <= start && time >= start - (minutes_before_meeting * 60)
    `terminal-notifier -message '#{msg} starts at #{start.strftime('%l:%M')}.' -title '#{title}' -open '#{link}' -sound 'Basso'`
  end

end

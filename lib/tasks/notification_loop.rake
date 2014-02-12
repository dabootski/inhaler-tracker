#
# Rake task that polls notifications table and sends
# notifications if object has been within range too long.
#
namespace :notifications do
  desc "This task does nothing"
  task :run => :environment do
    while true do
      begin
        Device.all.each do |device|
          next unless device.within_range?

          device.notifications.each do |n|
            puts "LAST OUT OF RANGE: #{device.last_out_of_range}"
            seconds_within_range = Time.now - device.last_out_of_range

            puts "SECONDS WITHIN RANGE: #{seconds_within_range}"
            puts "MAX SECONDS WITHIN RANGE: #{n.max_seconds_within_range}"

            next unless seconds_within_range >= n.max_seconds_within_range

            if !n.last_notified_at
              n.notify
            else
              seconds_since_last_notice = Time.now - n.last_notified_at

              puts "SECONDS SINCE LAST NOTICE: #{seconds_since_last_notice}"

              if seconds_since_last_notice > n.timeout &&
                seconds_since_last_notice > n.throttle_timeout
                n.notify 
              end
            end
          end
        end

        sleep(1)
      end
    end
  end
end

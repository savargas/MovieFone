require 'timeout'
require 'testmunk/calabash/logger'
require 'testmunk/calabash/utils/query'
require 'testmunk/calabash/screens/screens'
require 'testmunk/calabash/ios/screens/views/views'
require 'testmunk/calabash/ios/screens/views/view'

module Testmunk
  module IOS
    module MonkeyTest
      def interact(view)
        Testmunk::Log::log('Interacting with ' + view)
        view.touch({timeout: 3})
      end

      # Run a monkey test for current screen
      # @param event_count [Integer] number of events to fire
      # @param action_retry_count [Integer] how many times an action should be retried before failing. Default 5 times
      #   For instance touching can fail because an element is no longer visible
      # @param action_timeout timeout between actions
      #
      def monkey(event_count, action_retry_count=3, action_timeout=0.5)
        extend Testmunk::Utils::Query
        extend Testmunk::Screens
        extend Testmunk::IOS::Views
        extend Testmunk::IOS

        event_count.times do
          begin
            all = nil
            Timeout::timeout(5) { all = views }
          rescue Timeout::Error
            all = []
          end

          if all.nil? || all.empty?
            Testmunk::Log::log('Terminating. No views.', nil)
            break
          else
            begin

              tries ||= action_retry_count
              Timeout::timeout(5) { interact(all.sample) }
              sleep(action_timeout)

            rescue Timeout::Error
              break

            rescue Exception => e
              # view may not be visible anymore. If so, just continue
              if e.message.include? 'Timeout waiting'
                Testmunk::Log::log("#{e} happened because view is not visible anymore. Continuing..")
              else
                raise e
              end
            end
          end
        end
      end

    end
  end
end
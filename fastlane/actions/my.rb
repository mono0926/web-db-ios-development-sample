module Fastlane
  module Actions
    class MyAction < Action
        
      def self.run(params)
          some_param = params[:some_param]
          puts some_param
      end

      def self.is_supported?(platform)
        [:ios, :mac].include?platform
      end
      
      def self.available_options
          [
            FastlaneCore::ConfigItem.new(key: :some_param,
                                         env_name: "env",
                                         description: "desc",
                                         optional: false)
          ]
      end
    end
  end
end
require 'spec_helper'

module UaTools
  describe "UserAgent" do

    describe "detects mobile devices" do

      it "recognizes iOS" do
        iphone_strings = [
            "Mozilla/5.0 (iPhone; U; CPU like Mac OS X; nl-nl) AppleWebKit/420.1 (KHTML, like Gecko)",
            "Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko)",
            "Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/4A93 Safari/419.3"
        ]

        iphone_strings.each do |user_agent_string|
          puts user_agent_string
          user_agent = UserAgent.new(user_agent_string)
          puts user_agent.os
          user_agent.os.platform.should == :ios
          user_agent.os.mobile?.should be_true
        end

      end
    end

  end
end
require 'spec_helper'

module UaTools
  describe "UserAgent" do

    describe "detects mobile devices" do

      it "recognizes iOS" do
        user_agent_strings = [
            "Mozilla/5.0 (iPhone; U; CPU like Mac OS X; nl-nl) AppleWebKit/420.1 (KHTML, like Gecko)",
            "Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko)",
            "Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/4A93 Safari/419.3"
        ]
        user_agent_strings.each do |user_agent_string|
          test(user_agent_string, {platform: :ios, device: :mobile})
        end

      end

      it "recognizes Android phones" do
        user_agent_strings = [
            "Mozilla/5.0 (Linux; U; Android 4.0.1; en-us; Galaxy Nexus Build/ICL41) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30"
        ]
        user_agent_strings.each do |user_agent_string|
          test(user_agent_string, {platform: :android, device: :mobile})
        end

      end



    end

    describe "detects tablet devices" do
      it "recognized iPads" do
        iPad_strings = [
        "Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B367 Safari/531.21.10",
        "Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B334b Safari/531.21.10",
            "Mozilla/5.0 (iPad; U; CPU OS 4_2_1 like Mac OS X; ja-jp) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8C148 Safari/6533.18.5",
            "Mozilla/5.0 (iPad; CPU OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3" ]
        iPad_strings.each do |user_agent_string|
          test(user_agent_string, {platform: :ios, device: :tablet})
        end
      end

      it "recognized popular android tablets" do
        android_tablet_strings = [
            "Mozilla/5.0 (Linux; U; Android 3.0; en-us; Xoom Build/HRI39) AppleWebKit/534.13 (KHTML, like Gecko) Version/4.0 Safari/534.13",
            "Mozilla/5.0 (Linux; U; Android 3.0.1; en-us; Xoom Build/HRI66) AppleWebKit/534.13 (KHTML, like Gecko) Version/4.0 Safari/534.13",
            "Mozilla/5.0 (Linux; U; Android 3.1; en-us; GT-P7510 Build/HMJ37) AppleWebKit/534.13 (KHTML, like Gecko) Version/4.0 Safari/534.13",
            "Mozilla/5.0 (Linux; U; Android 4.0.3; en-us; Transformer TF101 Build/IML74K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30",
            "Mozilla/5.0 (Linux; U; Android-4.0.3; en-us; Xoom Build/IML77) AppleWebKit/535.7 (KHTML, like Gecko) CrMo/16.0.912.75 Safari/535.7"]
        android_tablet_strings.each do |user_agent_string|
          test(user_agent_string, {platform: :android, device: :tablet})
        end
      end
    end

    def test(user_agent_string, expect = { })
      user_agent = UserAgent.new(user_agent_string)
      puts user_agent.os
      puts user_agent.os.device
      user_agent.os.platform.should == expect[:platform]
      case expect[:device]
        when :mobile
          user_agent.os.mobile?.should be_true
          user_agent.os.tablet?.should_not be_true
        when :tablet
          user_agent.os.mobile?.should_not be_true
          user_agent.os.tablet?.should be_true
      end
      user_agent.os.device.should == expect[:device]
    end

  end
end
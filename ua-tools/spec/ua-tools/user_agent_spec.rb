require 'spec_helper'

module UaTools
  describe "UserAgent" do

    describe "detects mobile devices" do

      it "recognizes iOS" do
          test([
                   "Mozilla/5.0 (iPhone; U; CPU like Mac OS X; nl-nl) AppleWebKit/420.1 (KHTML, like Gecko)",
                   "Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko)",
                   "Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/4A93 Safari/419.3"
               ],
               { platform: :ios, device: :mobile })

      end

      it "recognizes Android phones" do
          test([
                   "Mozilla/5.0 (Linux; U; Android 4.0.1; en-us; Galaxy Nexus Build/ICL41) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30"
               ],
               { platform: :android, device: :mobile })
      end

    end

    describe "detects tablet devices" do
      it "recognized iPads" do
          test([
                   "Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B367 Safari/531.21.10",
                   "Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B334b Safari/531.21.10",
                   "Mozilla/5.0 (iPad; U; CPU OS 4_2_1 like Mac OS X; ja-jp) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8C148 Safari/6533.18.5",
                   "Mozilla/5.0 (iPad; CPU OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3" ],
               { platform: :ios, device: :tablet })
      end

      it "recognized popular android tablets" do
        test([
                 "Mozilla/5.0 (Linux; U; Android 3.0; en-us; Xoom Build/HRI39) AppleWebKit/534.13 (KHTML, like Gecko) Version/4.0 Safari/534.13",
                 "Mozilla/5.0 (Linux; U; Android 3.0.1; en-us; Xoom Build/HRI66) AppleWebKit/534.13 (KHTML, like Gecko) Version/4.0 Safari/534.13",
                 "Mozilla/5.0 (Linux; U; Android 3.1; en-us; GT-P7510 Build/HMJ37) AppleWebKit/534.13 (KHTML, like Gecko) Version/4.0 Safari/534.13",
                 "Mozilla/5.0 (Linux; U; Android 4.0.3; en-us; Transformer TF101 Build/IML74K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30",
                 "Mozilla/5.0 (Linux; U; Android-4.0.3; en-us; Xoom Build/IML77) AppleWebKit/535.7 (KHTML, like Gecko) CrMo/16.0.912.75 Safari/535.7"],
             { platform: :android, device: :tablet })
      end
    end

    describe "detect web-tv devices" do

      it "recognizes Google TV devices" do
        test([
                 "Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.127 Large Screen Safari/533.4 GoogleTV/161242",
                 "Mozilla/5.0 (X11; U: Linux i686; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.127 Large Screen Safari/533.4 GoogleTV/162671", # Sony
                 "Mozilla/5.0 (X11; U: Linux i686; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.127 Large Screen Safari/533.4 GoogleTV/b39389" #Logitech Revue
             ],
             { platform: :android, device: :tv })
      end

    end

    describe "detect desktop devices" do

      it "recognizes Windows computers" do
        test([
            "Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8 ( .NET CLR 3.5.30729)",
            "Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 2.0.50727)",
            "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506)",
            "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; MDDC; MSOffice 12)",
            "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Media Center PC 5.0; SLCC1; InfoPath.2)"
            ],
            { platform: :windows, device: :desktop })
      end

      it "recognizes Mac OS X computers" do
        test([
                 "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-us) AppleWebKit/533.19.4 (KHTML, like Gecko) Version/5.0.3 Safari/533.19.4",
                 "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_7; da-dk) AppleWebKit/533.21.1 (KHTML, like Gecko) Version/5.0.5 Safari/533.21.1"
             ],
             { platform: :macosx, device: :desktop })
      end



    end

    # helper method to perform the tests for user-agent strings
    def test(user_agent_strings, expect = { })
      user_agent_strings.each do |user_agent_string|
        user_agent = UserAgent.new(user_agent_string)
        puts user_agent.os
        puts user_agent.os.device
        user_agent.os.platform.should == expect[:platform]
        case expect[:device]
          when :mobile
            user_agent.os.mobile?.should be_true
            user_agent.os.tablet?.should_not be_true
            user_agent.os.desktop?.should_not be_true
            user_agent.os.webtv?.should_not be_true
          when :tablet
            user_agent.os.tablet?.should be_true
            user_agent.os.mobile?.should_not be_true
            user_agent.os.desktop?.should_not be_true
            user_agent.os.webtv?.should_not be_true
          when :desktop
            user_agent.os.desktop?.should be_true
            user_agent.os.mobile?.should_not be_true
            user_agent.os.tablet?.should_not be_true
            user_agent.os.webtv?.should_not be_true
          when :webtv
            user_agent.os.webtv?.should be_true
            user_agent.os.mobile?.should_not be_true
            user_agent.os.tablet?.should_not be_true
            user_agent.os.desktop?.should_not be_true
        end
        user_agent.os.device.should == expect[:device]
      end
    end

  end
end
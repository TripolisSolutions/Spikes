require 'test_helper'

class FacebookMessageTest < ActiveSupport::TestCase

  test "facebook message without actual message" do
    msg = FacebookMessage.new
    assert !msg.valid?
  end

  test "facebook message with actual message" do
    msg = FacebookMessage.new
    msg.message = "My Actual message"
    assert msg.valid?
    assert_equal("My Actual message",msg.message)
  end

  test "facebook message which is too short" do
    msg = FacebookMessage.new
    msg.message = "My"
    assert !msg.valid?
  end

  test "facebook message which is too long" do
    msg = FacebookMessage.new
    msg.message = "My Actual messageMy Actual messageMy Actual messageMy Actual messageMy Actual message
                   My Actual messageMy Actual messageMy Actual messageMy Actual messageMy Actual message
                   My Actual messageMy Actual messageMy Actual messageMy Actual messageMy Actual message
                   My Actual messageMy Actual messageMy Actual messageMy Actual messageMy Actual message "

    assert !msg.valid?
  end
end

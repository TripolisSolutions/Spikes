include ApplicationHelper

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error')
  end
end

RSpec::Matchers.define :have_notice_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-notice')
  end
end

def mock_twitter_auth
  OmniAuth.config.add_mock(:twitter, {
      uid: '12345',
      info: {
          name: 'Tripolis Solutions',
          nickname: 'tripolis',
          location: 'amsterdam',
          image: 'https://avatar.com',
          description: 'A test user on Twitter'
      },
      :credentials => {
          tolken: "abc",
          secret: "123"
      }
  })
end
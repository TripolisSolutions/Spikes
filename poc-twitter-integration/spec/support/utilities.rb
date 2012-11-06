include ApplicationHelper

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
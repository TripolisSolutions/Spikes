if (Rails.env == 'development' || Rails.env == 'staging')

  User.create(name: 'John Doe',
              email: 'JohnDoe@tripolis.com',
              features: 'web, posts, pages'
  )
  User.create(name: 'Frank Smith',
              email: 'FrankSmith@tripolis.com',
              features: 'web, posts'
  )
  User.create(name: 'Patty Smith',
              email: 'PattySmith@tripolis.com',
              features: 'posts'
  )

end
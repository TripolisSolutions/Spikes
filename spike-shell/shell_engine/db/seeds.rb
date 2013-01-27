if (Rails.env == 'development' || Rails.env == 'staging')

  User.create(name: 'John Doe',
                          email: 'JohnDoe@tripolis.com',
  )
  User.create(name: 'Frank Smith',
                          email: 'FrankSmith@tripolis.com',
  )

end
admin = User.create(
  {email: "gam3rsbuff@gmail.com",
   username: "admin",
   password: "123456",
   password_confirmation: "123456",
   admin: true
  }
)
admin.confirm

opix = User.create(
  {email: "mo3.khlifi@gmail.com",
   username: "opix",
   password: "123456",
   password_confirmation: "123456"
  }
)
opix.confirm

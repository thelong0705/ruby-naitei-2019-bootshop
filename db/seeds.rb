admin = User.create(name: "admin",
                    email: "example@gmail.com",
                    password: "password",
                    password_confirmation: "password")
admin.add_role :admin
admin.skip_confirmation!
admin.save

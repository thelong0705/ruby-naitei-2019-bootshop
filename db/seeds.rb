admin = User.create(name: "admin",
                    email: "example@gmail.com",
                    password: "password",
                    password_confirmation: "password")
admin.add_role :admin
admin.skip_confirmation!
admin.save

10.times do |index|
  Category.create(name: "Category #{index + 1}")
end

categories = Category.all

categories.each do |cat|
  5.times do
    cat.products.create(
      name: Faker::Commerce.product_name,
      price: Faker::Commerce.price(100..1000),
      image: Rails.root.join("public/images/products/#{1+rand(8)}.jpg").open
    )
  end
end

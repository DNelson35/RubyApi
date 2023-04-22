puts "🌱 Seeding spices..."
  Company.delete_all
  Drink.delete_all

  coca_cola = Company.create(name: "Coca Cola", logo_url: "https://us.coca-cola.com/content/dam/nagbrands/us/coke/en/participating-brands/logo_coke.jpg")

  coke_drinks = [
    {
        name: "Fanta", 
        description: "Orange carbanated beverage", 
        image_url: "https://images.unsplash.com/photo-1624517452488-04869289c4ca?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8ZmFudGF8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"
    },
    {
        name: "Sprite", 
        description: "Lemon-Lime carbanated beverage", 
        image_url: "https://images.unsplash.com/photo-1625772299848-391b6a87d7b3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c3ByaXRlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"
    },
    {
        name: "Dasani", 
        description: "Bottled water", 
        image_url: "https://target.scene7.com/is/image/Target/GUEST_0414b725-a1d5-4e31-a2d3-b2b8ab19073e?wid=325&hei=325&qlt=80&fmt=pjpeg"
    }
  ]

  coke_drinks.each do |drink|

    coca_cola.drinks.create(name: drink[:name], description: drink[:description], image_url: drink[:image_url])

  end


puts "✅ Done seeding!"
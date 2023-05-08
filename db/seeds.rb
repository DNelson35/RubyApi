puts "🌱 Seeding spices..."
  Company.delete_all
  Drink.delete_all

  coca_cola = Company.create(name: "Coca Cola", logo_url: "https://us.coca-cola.com/content/dam/nagbrands/us/coke/en/participating-brands/logo_coke.jpg")

  monster = Company.create(name: "Monster", logo_url: "https://images.unsplash.com/photo-1622543925917-763c34d1a86e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bW9uc3RlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60")

  pepsi = Company.create(name: "Pepsi", logo_url: "https://images.unsplash.com/photo-1533128555367-24f2584e23d7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHBlcHNpfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60")

  nestle = Company.create(name: 'Nestle', logo_url: "https://images.unsplash.com/photo-1632054010678-7f2e5a1a7355?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bmVzdGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60")

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

  monster_drinks = [
    {
      name: "Energy", 
      description: "Monsters original flavor",
      image_url: "https://images.unsplash.com/photo-1622543925917-763c34d1a86e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bW9uc3RlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"
    },
    {
      name: "Nebuina Mango",
      description: "good flavor great energy!",
      image_url: "https://images.unsplash.com/photo-1588180891305-0e6de022e52d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW9uc3RlciUyMGVuZXJneXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"
    }
  ]

  pepsi_drinks = [
    {
      name: "Pepsi",
      description: "on par with coke",
      image_url: "https://images.unsplash.com/photo-1629203851122-3726ecdf080e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVwc2l8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"
    }
  ]

  nestles_drinks = [
    {
      name: "Nescafe",
      description: "never had it",
      image_url: "https://images.unsplash.com/photo-1632054010678-7f2e5a1a7355?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bmVzdGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"
    }
  ]

  def seed(drinks , company)
    drinks.each do |drink|

      company.drinks.create(name: drink[:name], description: drink[:description], image_url: drink[:image_url])

    end
  end

  seed(coke_drinks, coca_cola)
  seed(monster_drinks, monster)
  seed(pepsi_drinks, pepsi)
  seed(nestles_drinks, nestle)




puts "✅ Done seeding!"
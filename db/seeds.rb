sections = %w(Breakfast Lunch Dinner Drinks)
cuisines = %w(Serbian Germany France)
4.times do
  sections.each do |section|
    Food.create(
        name: Faker::Name.name,
        description: Faker::Lorem.paragraph(1),
        image_url: Faker::Avatar.image,
        price: rand(50..101) * 1000,
        section: section,
        cuisine: cuisines[rand(3)],
        views_count: rand(20)
    )
  end
end
Food.all.each do |food|
  2.times do
    food.ratings.create(
        username: FFaker::Name.name,
        comment: FFaker::Lorem.paragraph(1),
        score: rand(5) + 1
    )
  end
end
Coupon.create(name: 'CODERSCHOOL', percent: 50)

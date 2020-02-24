1000.times do |i|
    Song.create({
      title: "Song #{i}",
      released_at: i.days.ago,
      artist_name: "DJ #{i}Man",
      rating: rand(i % 5) * rand
    })
  end
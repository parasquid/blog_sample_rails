# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

40.times do
  matz = ->{ Faker::Matz.unique.quote }
  one_piece = ->{ Faker::OnePiece.unique.quote }
  star_wars = ->{ Faker::StarWars.unique.quote }

  article = Article.create(title: Faker::Lorem.unique.sentence, text: [matz, one_piece, star_wars].sample.call)
  puts article.inspect
  rand(5..20).times do
    comment = article.comments.create(commenter: Faker::Witcher.character, body: Faker::Hacker.say_something_smart)
    puts comment.inspect
  end
end

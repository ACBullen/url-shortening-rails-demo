ActiveRecord::Base.transaction do
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  User.destroy_all
  ffd1 = User.create(email: "funkyfreshdog1@barkspace.com")
  ffd2 = User.create(email: "funkyfreshdog2@barkspace.com")
  ffd3 = User.create(email: "funkyfreshdog3@barkspace.com")
  ffd4 = User.create(email: "funkyfreshdog4@barkspace.com")
  ffd5 = User.create(email: "funkyfreshdog5@barkspace.com")
  ffd6 = User.create(email: "funkyfreshdog6@barkspace.com")

  ShortenedUrl.destroy_all
  shurly1 = ShortenedUrl.shorten_my_url(ffd1, 'https://www.barkspace.com/woof-of-week6')
  shurly2 = ShortenedUrl.shorten_my_url(ffd1, 'https://www.barkspace.com/woof-of-week5')
  shurly3 = ShortenedUrl.shorten_my_url(ffd1, 'https://www.barkspace.com/woof-of-week4')
  shurly4 = ShortenedUrl.shorten_my_url(ffd1, 'https://www.barkspace.com/woof-of-week3')
  shurly5 = ShortenedUrl.shorten_my_url(ffd2, 'https://www.barkspace.com/woof-of-week6')
  shurly6 = ShortenedUrl.shorten_my_url(ffd2, 'https://www.barkspace.com/woof-of-week2')
  shurly7 = ShortenedUrl.shorten_my_url(ffd3, 'https://www.barkspace.com/woof-of-week6')

  Visit.destroy_all
  v1 = Visit.record_visit!(ffd1, shurly7)
  v2 = Visit.record_visit!(ffd4, shurly3)
  v3 = Visit.record_visit!(ffd4, shurly2)
  v4 = Visit.record_visit!(ffd5, shurly1)
  v5 = Visit.record_visit!(ffd5, shurly1)
  v6 = Visit.record_visit!(ffd6, shurly7)

  TagTopic.destroy_all
  t1 = TagTopic.create(tag: "bark")
  t2 = TagTopic.create(tag: "berk")
  t3 = TagTopic.create(tag: "bork")
  t4 = TagTopic.create(tag: "woof")
  t5 = TagTopic.create(tag: "sniffsniff")
  t6 = TagTopic.create(tag: "sniff")
  t7 = TagTopic.create(tag: "hollow")
  t8 = TagTopic.create(tag: "Trump did nothing wrong!")

  Tagging.destroy_all
  tg1 = Tagging.create(user_id: ffd1.id, tag_id: t8.id, shortened_id: shurly1.id)
  tg2 = Tagging.create(user_id: ffd2.id, tag_id: t1.id, shortened_id: shurly3.id)
  tg3 = Tagging.create(user_id: ffd5.id, tag_id: t5.id, shortened_id: shurly1.id)
  tg4 = Tagging.create(user_id: ffd5.id, tag_id: t5.id, shortened_id: shurly1.id)
  tg5 = Tagging.create(user_id: ffd5.id, tag_id: t5.id, shortened_id: shurly2.id)
  tg6 = Tagging.create(user_id: ffd5.id, tag_id: t5.id, shortened_id: shurly3.id)
  tg7 = Tagging.create(user_id: ffd5.id, tag_id: t5.id, shortened_id: shurly5.id)
  tg8 = Tagging.create(user_id: ffd5.id, tag_id: t5.id, shortened_id: shurly2.id)
end

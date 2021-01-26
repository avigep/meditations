# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

thought_content = <<-eos
Meditations is a series of personal writings by Marcus Aurelius, Roman Emperor from 161 to 180 AD, recording his private notes to himself and ideas on Stoic philosophy.
Marcus Aurelius wrote the 12 books of the Meditations in Koine Greek[1] as a source for his own guidance and self-improvement.[2] It is possible that large portions of the work were written at Sirmium, where he spent much time planning military campaigns from 170 to 180. Some of it was written while he was positioned at Aquincum on campaign in Pannonia, because internal notes tell us that the first book was written when he was campaigning against the Quadi on the river Granova (modern-day Hron) and the second book was written at Carnuntum.
It is unlikely that Marcus Aurelius ever intended the writings to be published. The work has no official title, so "Meditations" is one of several titles commonly assigned to the collection. These writings take the form of quotations varying in length from one sentence to long paragraphs.
eos

thought_title = "Thought Title # "

# Simple visible thoughts
12.times.each do |iteration|
  Thought.create!(
      title: thought_title << iteration,
      contents: thought_content,
      publish_date: Date.today,
      visible: true
  )
end


# invisible thoughts
(11..25).each do |iteration|
    Thought.create!(
        title: thought_title + iteration.to_s,
        contents: thought_content,
        publish_date: Date.today,
        visible: false
    )
end

# for search results

Thought.create!(
    title: thought_title + "search test",
    contents: thought_content + "hogehoge",
    publish_date: Date.today,
    visible: true
)

Thought.create!(
    title: thought_title + "search test hogehoge to title",
    contents: thought_content,
    publish_date: Date.today,
    visible: true
)

User.create!(
    email: 'test@test.com',
    password: 'test001',
)


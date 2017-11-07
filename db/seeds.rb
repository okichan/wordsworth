# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   Character.create(name: 'Luke', movie: movies.first)

Question.all.each do |n| n.update_attribute(:paid, true); end

    a = Question.where(:paid =>  nil)

a.each do |b|
    b.paid = true
    b.update
end
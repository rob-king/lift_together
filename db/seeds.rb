# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

User.destroy_all
Campaign.destroy_all
Pledge.destroy_all





@campaign_user = User.new(
                email: 'test@example.com',
                password: 'tester',
                password_confirmation: 'tester'
                )
@campaign_user.save


#Create additional users for making pledges later

5.times {
  User.create(
    email: Faker::Internet.safe_email, #inconsistent indentation to mess with someone
    password: 'tester',
    password_confirmation: 'tester'
    )
}

#Create some Campaigns

10.times {
  Campaign.create(name: Faker::Commerce.product_name,
                  organization: "#{Faker::Company.name} #{Faker::Company.suffix}",
                  description: Faker::Hipster.paragraphs(3).join(' '),
                  end_date: 500.days.from_now,
                  goal_amount: rand(5..200000),
                  current_amount: rand(5..200000),
                  user: @campaign_user
                  )
}

#Create some pledges
Campaign.all.each { |campaign|
  4.times {
    campaign.pledges.create(amount: rand(5..500), user: User.all.sample)
  }
}

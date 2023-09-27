# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

begin
    User.create(
      name: "John Doe",
      email: "2@ffs.d",
      password: "password"
    )

    Group.create(
        name: "Group 1",
        icon: "",       
        user_id: 1
      )
     
    Expense.create(
        name: "Group 1",
        amount: 10000,       
        user_id: 1
      )

      GroupExpense.create(
        group_id: 1,
        expense_id: 1,       
      )

      20.times do
        Group.create(
            name: "Group 1",
            icon: "",       
            user_id: 1
          )
      end

      prng = Random.new

      20.times do
        User.create(
          name: Faker::Name.unique.name,
          email: Faker::Internet.email,
          password: "password"
        )
      end

      20.times do
        Group.create(
            name: "#{Faker::Lorem.word} #{ Group}",
            icon: "",       
            user_id: prng.rand(1..20) 
        )
    end

    20.times do
        Expense.create(
            name: "#{Faker::Lorem.word} #{ Expense}",
            amount: Faker::Number.decimal(l_digits: 2).to_f,       
            user_id: prng.rand(1..20) 
        )
    end

    20.times do
        GroupExpense.create(
            group_id: prng.rand(1..20),
            expense_id: prng.rand(1..20),       
          )
    end
 
    puts "Data Seeded."

rescue ActiveRecord::RecordInvalid => e
    puts "Validation error occurred: #{e.message}"
end
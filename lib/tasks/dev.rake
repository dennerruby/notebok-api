namespace :dev do
  desc "Gerando dados de contatos"
  task setup: :environment do
    puts "criando os contatos..."
    200.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: '1991-09-23', to: '2014-09-25')
      )
    end
  end

end

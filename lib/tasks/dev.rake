namespace :dev do
  desc "Gerando dados de contatos"
  task setup: :environment do
    puts "Resetando o banco de dados...Yeah !!!!"

     %x(rails db:drop db:create db:migrate)

    puts "Cadastrando os tipos de contato..."

    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts "Tipos Contato cadastrados com sucesso!"

    ######################

    puts "Cadastrando os contatos..."

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: '1991-09-23', to: '2014-09-25'),
        kind: Kind.all.sample
      )
    end

    #####################

      puts "Cadastrando os telefones..."

      Contact.all.each do |contact|
        Random.rand(5).times do |i|
          phone = Phone.create!(number:Faker::PhoneNumber.cell_phone)
          contact.phones << phone
          contact.save!
        end
      end

      puts "Telefones cadastrados com sucesso!"

    ######################

    puts "Cadastrando os Enderecos..."

    Contact.all.each do |contact|
      address = Address.create(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )

     end

    puts "Enderecos cadastrados com sucesso!"
  end
end




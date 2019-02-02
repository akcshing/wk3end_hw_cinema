require_relative("models/customer")
require_relative("models/film")
require_relative("models/ticket")

require("pry")

Customer.delete_all()
Film.delete_all()

customer_1 = Customer.new({"name"=>"Alex", "funds"=>30})
customer_2 = Customer.new({"name"=>"Roderick", "funds"=>40})
customer_3 = Customer.new({"name"=>"Stacey", "funds"=>25})

customer_1.save
customer_2.save
customer_3.save

film_1 = Film.new({"title"=>"Aquaman", "price"=>4})
film_2 = Film.new({"title"=>"Dragonball", "price"=>3})
film_3 = Film.new({"title"=>"Spiderman", "price"=>5})

film_1.save
film_2.save
film_3.save

ticket_1 = Ticket.new({"customer_id" => customer_1.id, "film_id" => film_3.id})

ticket_1.save

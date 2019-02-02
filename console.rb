require_relative("models/customer")
require_relative("models/film")
require_relative("models/ticket")

require("pry")

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer_1 = Customer.new({"name"=>"Alex", "funds"=>30})
customer_2 = Customer.new({"name"=>"Roderick", "funds"=>40})
customer_3 = Customer.new({"name"=>"Stacey", "funds"=>25})

customer_1.save
customer_2.save
customer_3.save

customer_1.funds = 40
customer_1.update()

film_1 = Film.new({"title"=>"Aquaman", "price"=>4})
film_2 = Film.new({"title"=>"Dragonball", "price"=>3})
film_3 = Film.new({"title"=>"Spiderman", "price"=>5})

film_1.save
film_2.save
film_3.save

film_1.title = "Avengers"
film_1.update

ticket_1 = Ticket.new({"customer_id" => customer_1.id, "film_id" => film_3.id})
ticket_2 = Ticket.new({"customer_id" => customer_1.id, "film_id" => film_1.id})
ticket_3 = Ticket.new({"customer_id" => customer_2.id, "film_id" => film_2.id})

ticket_1.save
ticket_2.save
ticket_3.save

# ticket_1.customer_id = customer_3.id
ticket_1.update


# Customer.all

customer_1.films
film_3.customers

customer_1.remaining_funds

customer_1.ticket_count

film_3.customer_count
binding.pry

nil

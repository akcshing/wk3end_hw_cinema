require_relative("../db/sql_runner")
require("pry")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize( options )
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @funds = options["funds"]
  end

  def films()
    sql = "SELECT films.* FROM films
    INNER JOIN tickets
    ON tickets.film_id = films.id
    WHERE tickets.customer_id = $1"    # inner joins
    values = [@id]
    films = SqlRunner.run(sql, values)
    results = films.map{|film| Film.new(film)}
    return results
  end

  def remaining_funds
    films = self.films
    film_prices_array = films.map{|film| film.price.to_i }
    # p film_prices_array
    total_price = film_prices_array.sum
    @funds -= total_price
    self.update
  end

  def ticket_count
    films = self.films
    ticket_count = films.count
    return ticket_count
  end

  def save
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING *"
    values = [@name, @funds]
    @id = SqlRunner.run(sql, values)[0]["id"]
  end

  def update
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    result = customers.map{|customer| Customer.new(customer)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end


end

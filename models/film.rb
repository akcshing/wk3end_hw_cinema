require_relative("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize( options )
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @price = options["price"]
  end

  def customers()
    sql = "SELECT customers.* FROM customers
    INNER JOIN tickets
    ON tickets.customer_id = customers.id
    WHERE tickets.film_id = $1"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    results = customers.map{|customer| Customer.new(customer)}
    return results
  end

  def save
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING *"
    values = [@title, @price]
    @id = SqlRunner.run(sql, values)[0]["id"]
  end

  def update
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end
end

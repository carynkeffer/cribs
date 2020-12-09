class House
  attr_reader :price,
              :address,
              :rooms,
              :house_details
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
    @house_details = Hash.new
  end

  def price
    @price.delete("$").to_i
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    price > 500000
  end

  def rooms_from_category(category)
    category_of_rooms = []
    rooms.each do |room|
      (category_of_rooms << room) if (room.category == category)
    end
    category_of_rooms
  end

  def house_area
    rooms.map do |room|
      room.area
    end
  end

  def area
    house_area.sum
  end

  def details
    house_details["price"] = price
    house_details["address"] = address
    return house_details
  end

  def price_per_square_foot
    area / 9.024842065263858
  end
end

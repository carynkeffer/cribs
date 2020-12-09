class House
  attr_reader :price,
              :address,
              :rooms
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
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
    details = Hash.new
    details["price"] = price
    details["address"] = address
    return details
  end
end

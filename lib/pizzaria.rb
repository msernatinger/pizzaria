class Pizzaria < InteractiveShop

  INGREDIENTS = ["sausage", "mushroom", "pepperoni", "green peppers", "onions", "olives", "pineapple"]

  def start_new_order
    @current_order = Order.new
  end

  def add_pizza
  end

  def add_slice
  end

  def add_soft_drink
  end

  def list_inventory
  end
  
  def order_ingredient
  end 

  def select_pizza_size
  end

  def add_ingredient
  end
    
  def display_order
  end

  def charge_total
  end

  def discard_order
  end

  def check_oven_timers
  end

  def place_pizzas_in_oven
  end

  def remove_pizzas_from_oven
  end

  def system_quit
    exit
  end
  

end

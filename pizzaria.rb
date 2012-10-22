require File.expand_path('lib/interactive_shop')
require File.expand_path('lib/pizzaria')
require File.expand_path('lib/terminal_menu')
require File.expand_path('lib/terminal')

menu = TerminalMenu.builder do 

  first_screen :welcome

  menu_screen :welcome do
    title "Welcome to Panucci's Computerized Management System"
    menu_item "New Order", :new_order, :start_new_order
    menu_item "Inventory", :inventory
    menu_item "Manage Ovens", :ovens
    menu_item "Exit", :exit, :system_quit
  end

  menu_screen :new_order do
    title "Create a new Order"
    menu_item "Whole Pizza", :pizza_sizes, :add_pizza
    menu_item "Pizza By The Slice", :slice_order
    menu_item "Soft Drink", :edit_order, :add_soft_drink
    menu_item "Go Back", :welcome
  end

  menu_screen :inventory do
    title "Manage Inventory"
    menu_item "View Ingredients On-Hand", :inventory_listing, :list_inventory
    menu_item "Re-Stock Ingredients", :restock_listing, :order_ingredient
    menu_item "Go Back", :welcome
  end

  menu_screen :ovens do
    title "Manage Ovens"
    menu_item "Check Timers", :ovens, :check_oven_timers
    menu_item "Remove Pizzas", :ovens, :remove_pizzas_from_oven
    menu_item "Place Pizzas", :ovens, :place_pizzas_in_oven
  end

  menu_screen :inventory_listing do
    title "List Inventory"
    menu_item "Go Back", :inventory
  end

  menu_screen :restock_listing do
    title "Order More Ingredients" 
    menu_item "Go Back", :inventory
  end

  menu_screen :pizza_sizes do
    title "Select a Size" 
    menu_item "Small", :select_ingredients, :select_pizza_size
    menu_item "Medium", :select_ingredients, :select_pizza_size
    menu_item "Large", :select_ingredients, :select_pizza_size
    menu_item "Go Back", :edit_order
  end

  menu_screen :slice_order do
    title "Ordering Pizza By the Slice"
    menu_item "Pepperoni", :edit_order, :add_slice
    menu_item "Sausage", :edit_order, :add_slice
    menu_item "Cheese", :edit_order, :add_slice
    menu_item "Mushroom", :edit_order, :add_slice
    menu_item "Go Back", :edit_order
  end

  menu_screen :select_ingredients do
    title "Add Ingredients" 
    Pizzaria::INGREDIENTS.each do |ingredient|
      menu_item ingredient, :select_ingredients, :add_ingredient
    end
    menu_item "Done", :edit_order
  end

  menu_screen :edit_order do
    title "Taking an Order"
    menu_item "Whole Pizza", :pizza_sizes, :add_pizza
    menu_item "Pizza By The Slice", :add_slice
    menu_item "Soft Drink", :edit_order, :add_soft_drink
    menu_item "Complete Order", :finalize_order, :display_order
    menu_item "Cancel Order", :welcome
  end

  menu_screen :finalize_order do
    title "Confirm Order"
    menu_item "Confirm", :welcome, :charge_total
    menu_item "Cancel", :welcome, :discard_order
  end

  menu_screen :exit do
    title "Goodbye!"
  end

end

Pizzaria.config do |config|
  config.menu = menu
end

terminal = Terminal.new(menu)
Pizzaria.new(terminal).run


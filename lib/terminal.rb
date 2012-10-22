class Terminal

  attr_accessor :command

  def initialize(menu)
    @menu = menu
  end

  def print_menu
    system("clear")
    puts @menu.show_screen
  end

  def get_command
    print "> "
    @number_key_press = get_input
    @command = @menu.select_option(@number_key_press)
  end

  def execute_command
    Pizzaria.handle_command(@command)   
  end

  private 

  def get_input
    gets.chomp.to_i
  end

end

require 'io/console'

class Terminal

  attr_accessor :command

  def initialize(menu)
    @menu = menu
  end

  def clear_screen
    system("clear")
  end

  def display(str)
    puts str
  end

  def get_numeric_command
    print "> "
    @number_key_press = get_input.to_i
  end

  def clear_screen_on_keystroke
    STDIN.getch
    clear_screen
  end

  def execute_command
    Pizzaria.handle_command(@command)   
  end

  private 

  def get_input
    gets.chomp
  end

end

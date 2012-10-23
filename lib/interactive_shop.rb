class InteractiveShop

  attr_accessor :terminal
  attr_accessor :command_result

  def self.config 
    yield self
  end

  def self.menu= menu
    @@menu = menu
  end

  def self.menu
    @@menu
  end

  def initialize(terminal = nil)
    @terminal = terminal
  end

  def display_result
    @terminal.display(command_result)
    command_result.clear
    @terminal.clear_screen_on_keystroke
  end

  def last_menu_selection
    @@menu.last_selection
  end

  def run
    @terminal.display("Welcome to Panucci's!  v0.1")
    @terminal.clear_screen_on_keystroke
    while 1 do
      @terminal.clear_screen
      @terminal.display(@@menu.show_screen)
      number_key_press = @terminal.get_numeric_command
  
      command = @@menu.select_option(number_key_press)
      handle_command(command) if command
    end
  end

  def handle_command(command)
    exit if command == :system_quit
  end

end

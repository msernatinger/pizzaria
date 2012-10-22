class InteractiveShop

  attr_accessor :terminal

  def self.config 
    yield self
  end

  def self.menu= menu
    @@menu = menu
  end

  def initialize(terminal = nil)
    @terminal = terminal
  end

  def run
    while 1 do
      @terminal.clear_screen
      @terminal.display(@@menu.show_screen)
      number_key_press = @terminal.get_numeric_command
  
      command = @@menu.select_option(number_key_press)
      handle_command(command) if command
    end
  end

  def handle_command(command)

    self.send(command) 

  end

end

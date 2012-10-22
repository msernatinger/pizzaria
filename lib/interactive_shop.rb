class InteractiveShop

  def self.config 
    yield self
  end


  def initialize(terminal = nil)
    @terminal = terminal
  end

  def run
    while 1 do
      @terminal.print_menu
      command = @terminal.get_command
      handle_command(command) if command
    end
  end

  def handle_command(command)

    self.send(command) 

  end

end

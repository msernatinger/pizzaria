
class TerminalMenu

  attr_accessor :screens
  attr_reader :last_selection

  def initialize
    @screens = {}
  end

  def show_screen
    screen_output = "=" * 60
    screen_output << "\n"
    screen_output << "#{current_screen[:title]}\n"
    screen_output << "=" * 60
    screen_output << "\n"
    current_screen[:menu_items].each_with_index do |item, index|
      screen_output << format("\t%d.\t%s", index, item[:label])
      screen_output << "\n"
    end
    return screen_output
  end

  def select_option item_number
    selection = current_screen[:menu_items][item_number]
    last_selection = [item_number, selection]
    @current_screen = selection[:next_menu]
    return selection[:command]
  end

  def self.builder &block
    menu = self.new
    menu.instance_eval &block
    return menu
  end

  protected

  def last_selection= val
    @selection = val
  end

  def current_screen
    raise "No screens have been defined" if @screens.empty?
    screen_id = @current_screen || @screens.first[0]
    @screens[screen_id]
  end

  def menu_screen name, &block
    @screen_to_build = {name: name, menu_items: []}
    instance_eval &block
    @screens[name] = @screen_to_build
  end

  def title val
    @screen_to_build[:title] = val
  end

  def menu_item label, next_menu, command = nil
    @screen_to_build[:menu_items] << {label: label, next_menu: next_menu, command: command}
  end

  def first_screen screen_id
    @current_screen = screen_id
  end

end


class Advocate
  attr_accessor :name, :juniors, :state, :cases, :junior, :sr_advocate
  def initialize(name, sr_advocate = nil)
    @name = name
    @cases = []
    @state = nil
    @sr_advocate = sr_advocate
  end

  def print_info(delimeter = "")
    puts "#{delimeter}Advocate name: #{name}"
  end

  def juniors(advocates = [])
    advocates.select { |adv| adv.sr_advocate == name }
  end
end

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
    puts "#{delimeter}Practicing state: #{state}"
  end

  def juniors(advocates = [])
    advocates.select { |adv| adv.sr_advocate == name }
  end

  def add_practicing_state(state_name, jr_adv = nil)
    !jr_adv.nil? ? jr_adv.state = state_name : self.state = state_name
  end
end

class Advocate
  attr_accessor :id, :juniors, :states, :cases, :junior, :sr_advocate
  def initialize(id, sr_advocate = nil)
    @id = id
    @cases = []
    @states = []
    @sr_advocate = sr_advocate
  end

  def print_info(delimeter = "")
    puts "#{delimeter}Advocate id: #{id}"
    puts "#{delimeter}Practicing states: #{states.join(', ')}"
  end

  def juniors(advocates = [])
    advocates.select { |adv| adv.sr_advocate == id }
  end

  def add_practicing_state(state_name, jr_adv = nil)
    !jr_adv.nil? ? jr_adv.states << state_name : self.states << state_name
  end
end

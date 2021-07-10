require 'set'
class Advocate
  attr_accessor :id, :juniors, :states, :state_wise_cases, :junior, :sr_advocate
  def initialize(id, sr_advocate = nil)
    @id = id
    @state_wise_cases = {}
    @states = Set.new
    @sr_advocate = sr_advocate
  end

  def print_info(delimeter = "")
    puts "\n#{delimeter}Advocate id: #{id}"
    print "\n#{delimeter}Practicing states: #{states.to_a.join(', ')}"
    print("\n#{delimeter}Rejected cases: ")
    cases_by_status('rejected').each {|ac| print("Case id: #{ac.id}, State: #{ac.state} ")}
    print("\n#{delimeter}Practicing cases: ")
    cases_by_status('active').each {|ac| print("Case id: #{ac.id}, State: #{ac.state} ")}
  end

  def juniors(advocates = [])
    advocates.select { |adv| adv.sr_advocate == id }
  end

  def add_practicing_state(state_name, jr_adv = nil)
    jr_adv.nil? ? self.states << state_name : jr_adv.states << state_name
  end

  def add_case(case_id, state_name)
    unless states.include?(state_name)
      puts "Can not add case becasue you are not practicing in #{state_name}"
      return
    end
    old_cases = self.state_wise_cases.values.flatten.select {|ac| ac.id == case_id}
    if old_cases.length > 0
      puts "This case is already being practiced in state #{old_case[0].state} state"
      return
    end
    new_case = AdvocateCase.new(case_id, id, state_name)
    self.state_wise_cases[state_name].nil? ? self.state_wise_cases[state_name] = [new_case] : self.state_wise_cases[state_name] << new_case
    puts "\nCase #{case_id} added under #{state_name} state"
  end

  def reject_case(adv_case)
    adv_case.reject(id)
  end

  private

  def cases_by_status(status)
    state_wise_cases.values.flatten.select {|ac| ac.status == status }
  end

end

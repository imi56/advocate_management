require_relative './advocate'


class AdvocateManager
  attr_accessor :advocates
  def initialize
    @advocates = []
  end

  def add_advocate
    print "Enter advocate to be added: "
    advocate_name = gets.strip
    self.advocates << Advocate.new(advocate_name)
    puts "Advocate #{advocate_name} added"
  end

  def add_junior_advocate
  end

  def add_advocate_state
  end

  def add_advocate_case
  end

  def reject_case
  end

  def display_all_advocates

  end

  def display_all_cases_in_state(state)
  end

end

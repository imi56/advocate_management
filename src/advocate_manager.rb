require 'byebug'
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
    puts "\n*** Advocate #{advocate_name} added ***"
  end

  def add_junior_advocate
    print "Enter senior advocate name: "
    sr_adv_name = gets.strip
    sr_adv = find_sr_advocate(sr_adv_name)
    print "\nEnter junior advocate name: "
    jr_adv_name = gets.strip
    self.advocates << Advocate.new(jr_adv_name, sr_adv.name)
    puts "Advocate #{jr_adv_name} added under #{sr_adv_name}"
  end

  def add_advocate_state
  end

  def add_advocate_case
  end

  def reject_case
  end

  def display_all_advocates
    puts "*** Listing all advocates below. ***"
    sr_advocates = advocates.select { |adv| adv.sr_advocate.nil? }
    sr_advocates.each do |adv|
      adv.print_info
      # Printing 1 level nested juniors only
      adv.juniors(advocates).each do |jr_adv|
        jr_adv.print_info("  - ")
      end
    end
  end

  def display_all_cases_in_state(state)
  end

  def find_sr_advocate(adv_name)
    advs = @advocates.select { |adv| adv.name == adv_name && adv.sr_advocate.nil? }
    if advs.size > 1
      puts "Duplicate advocates found with name #{adv_name}\nexiting..."
      exit
    end
    if advs.size == 0
      puts "No senior such advocate found\nexiting..."
      exit
    end
    advs.first
  end

end

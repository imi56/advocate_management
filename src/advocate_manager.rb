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
    puts "No such senior advocate found" and return if sr_adv.nil?
    print "\nEnter junior advocate name: "
    jr_adv_name = gets.strip
    self.advocates << Advocate.new(jr_adv_name, sr_adv.name)
    puts "Advocate #{jr_adv_name} added under #{sr_adv_name}"
  end

  def add_advocate_state
    print "\nEnter your name: "
    adv_name = gets.strip
    sr_adv = find_sr_advocate(adv_name)
    # if adv is sr then its sr_advocate attr should be nil
    if sr_adv.nil?
      jr_adv = find_jr_advocate(adv_name)
      puts "No such junior advocate found #{adv_name}" and return if jr_adv.nil?
      puts "Only senior advocate can add practicing state"
      print "\nEnter your senior advocate name: "
      sr_adv = find_sr_advocate(gets.strip)
      puts "No such senior advocate found" and return if sr_adv.nil?
    end
    print "\nEnter practicing state: "
    state = gets.strip
    sr_adv.add_practicing_state(state, jr_adv)
    puts "\nState #{state} added for #{jr_adv.nil? ? sr_adv.name : jr_adv.name }"
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

  private

  def find_sr_advocate(adv_name)
    advs = @advocates.select { |adv| adv.name.downcase == adv_name.downcase && adv.sr_advocate.nil? }
    if advs.size > 1
      puts "Duplicate advocates found with name #{adv_name}\nexiting..."
      exit
    end
    advs.first
  end

  def find_jr_advocate(adv_name)
    advs = @advocates.select { |adv| adv.name.downcase == adv_name.downcase && !adv.sr_advocate.nil? }
    if advs.size > 1
      puts "Duplicate advocates found with name #{adv_name}\nexiting..."
      exit
    end
    advs.first
  end

end

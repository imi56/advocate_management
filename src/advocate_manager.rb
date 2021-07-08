require 'byebug'
require_relative './advocate'
require_relative './advocate_case'


class AdvocateManager
  attr_accessor :advocates
  def initialize
    @advocates = []
  end

  def add_advocate
    print "Enter advocate id to be added: "
    advocate_id = gets.strip
    self.advocates << Advocate.new(advocate_id)
    puts "\n*** Advocate #{advocate_id} added ***"
  end

  def add_junior_advocate
    print "Enter senior advocate id: "
    sr_adv_id = gets.strip
    sr_adv = find_sr_advocate(sr_adv_id)
    if sr_adv.nil?
      puts "No such senior advocate found"
      return 
    end
    print "\nEnter junior advocate id: "
    jr_adv_id = gets.strip
    self.advocates << Advocate.new(jr_adv_id, sr_adv.id)
    puts "Advocate #{jr_adv_id} added under #{sr_adv_id}"
  end

  def add_advocate_state
    print "\nEnter your id: "
    adv_id = gets.strip
    sr_adv = find_sr_advocate(adv_id)
    # if adv is sr then its sr_advocate attr should be nil
    if sr_adv.nil?
      jr_adv = find_jr_advocate(adv_id)
      if jr_adv.nil?
        puts "No such junior advocate found #{adv_id}"
        return 
      end
      puts "Only senior advocate can add practicing state"
      print "\nEnter your senior advocate id: "
      sr_adv = find_sr_advocate(gets.strip)
      if sr_adv.nil?
        puts "No such senior advocate found"
        return 
      end
    end
    print "\nEnter practicing state: "
    state = gets.strip
    sr_adv.add_practicing_state(state, jr_adv)
    puts "\nState #{state} added for #{jr_adv.nil? ? sr_adv.id : jr_adv.id }"
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

  def find_sr_advocate(adv_id)
    advs = @advocates.select { |adv| adv.id.downcase == adv_id.downcase && adv.sr_advocate.nil? }
    if advs.size > 1
      puts "Duplicate advocates found with id #{adv_id}\nexiting..."
      exit
    end
    advs.first
  end

  def find_jr_advocate(adv_id)
    advs = @advocates.select { |adv| adv.id.downcase == adv_id.downcase && !adv.sr_advocate.nil? }
    if advs.size > 1
      puts "Duplicate advocates found with id #{adv_id}\nexiting..."
      exit
    end
    advs.first
  end

end

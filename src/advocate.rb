class Advocate
  attr_accessor :name, :juniors, :state, :cases, :junior
  def initialize(name, junior = false)
    @name = name
    @juniors = []
    @cases = []
    @state = nil
    @junior = junior
  end

  def print_info(delimeter = "")
    puts "#{delimeter}Advocate name: #{name}"
  end
  
end

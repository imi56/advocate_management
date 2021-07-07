class Advocate
  attr_accessor :name, :juniors, :state, :cases
  def initialize(name)
    @name = name
    @juniors = []
    @cases = []
    @state = nil
  end
end

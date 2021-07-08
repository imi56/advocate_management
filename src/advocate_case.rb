class AdvocateCase
  attr_accessor :id, :state, :status
  def initialize(id, status = "active")
    @id = id
    @status = status
  end
end

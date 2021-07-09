class AdvocateCase
  attr_accessor :id, :advocate_id, :state, :status, :rejected_by
  def initialize(id, advocate_id, status = "active")
    @id = id
    @advocate_id = advocate_id
    @status = status
  end
end

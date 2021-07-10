class AdvocateCase
  attr_accessor :id, :advocate_id, :state, :status, :rejected_by
  def initialize(id, advocate_id, state, status = "active")
    @id = id
    @advocate_id = advocate_id
    @status = status
    @rejected_by = nil
    @state = state
  end

  def reject(rejected_by)
    self.status = 'rejected'
    self.rejected_by = rejected_by
    puts "Case #{id} rejected"
  end
end

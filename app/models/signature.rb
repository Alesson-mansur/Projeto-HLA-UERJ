class Signature < ApplicationRecord
  belongs_to :dnanum, optional: true
  belongs_to :board, optional: true

  before_destroy :dont_destroy_record

  private

  def dont_destroy_record
    if (self.created_at.to_date) < (Date.today - 3.days)
	   throw(:abort)
	end
  end
  
end

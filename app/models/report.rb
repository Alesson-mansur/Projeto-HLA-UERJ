class Report < ApplicationRecord
  belongs_to :board
  belongs_to :phase
  belongs_to :reagent

  before_destroy :dont_destroy_record

  private

  def dont_destroy_record
    if (self.created_at.to_date) < (Date.today - 3.days)
        throw(:abort)
    end
  end
  
end

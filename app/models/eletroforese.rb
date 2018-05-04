class Eletroforese < ApplicationRecord
  belongs_to :board
  belongs_to :phase

  before_update :date_exp
  before_destroy :dont_destroy_record

  private

  def date_exp
  	if (self.created_at.to_date) < (Date.today - 3.days)
  		errors.add(:eletroforese, "^Período de edição já expirou.")
		  throw(:abort)
	  end
  end

  def dont_destroy_record
    if (self.created_at.to_date) < (Date.today - 3.days)
        throw(:abort)
    end
  end

end

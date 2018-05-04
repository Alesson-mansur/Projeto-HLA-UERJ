class Phase < ApplicationRecord
  belongs_to :board

  has_one :pcr, :dependent => :destroy
  has_one :eletroforese, :dependent => :destroy
  has_one :hibrid, :dependent => :destroy
  has_one :interp, :dependent => :destroy
  has_one :interpret, :dependent => :destroy
  has_one :relat, :dependent => :destroy
  has_one :report, :dependent => :destroy
  
  before_update :date_exp
  before_destroy :dont_destroy_record

  private

  def date_exp
    if (self.created_at.to_date) < (Date.today - 3.days)
      errors.add(:phase, "^Período de edição já expirou.")
      throw(:abort)
    end
  end

  def dont_destroy_record
    if (self.created_at.to_date) < (Date.today - 3.days)
        throw(:abort)
    end
  end

end

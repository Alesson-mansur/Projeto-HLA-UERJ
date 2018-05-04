class Reagent < ApplicationRecord
	belongs_to :board

	has_many :dnanums
	has_one :report, :dependent => :destroy

	validate :img_and_amplific

  	has_attached_file :image, 
  					  styles: { large: "400x300#", medium: "300x300>", thumb: "100x100#" }, 
  					  default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  	#validate :file_dimensions, :unless => 'errors.any?'

	#def file_dimensions
	#  if image.size
	#    dimensions = Paperclip::Geometry.from_file(image.queued_for_write[:original].path)
	#    if dimensions.width < 120 || dimensions.height < 120
	#      errors.add(:image,'deve ter no minimo 120px de largura por 90px de altura')
	#    end
	#   end
	#end
	
	def img_and_amplific
		if (self.image.blank?)
			if (self.amplific == 'Sim') || (self.amplific == 'Não') || (self.amplific.blank?)
			else	
				errors.add(:amplific, 'Não tente me enganar.')
			end
		else
			if (self.amplific != 'Sim') && (self.amplific != 'Não')
				errors.add(:amplific, 'Diga se alguma amostra foi reprovada.')
			end
			if (self.amplific == 'Sim') && (self.dnanum_ids.blank?)
				errors.add(:amplific, 'Por favor, aponte as amostras que foram reprovadas.')
			end
		end			
	end

	before_update :date_exp
	before_destroy :dont_destroy_record

	private

	def date_exp
		if (self.created_at.to_date) < (Date.today - 3.days)
			errors.add(:reagent, "^Período de edição já expirou.")
			throw(:abort)
		end
	end

	def dont_destroy_record
		if (self.created_at.to_date) < (Date.today - 3.days)
		    throw(:abort)
		end
	end

end

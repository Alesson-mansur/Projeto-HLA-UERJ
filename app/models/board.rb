class Board < ApplicationRecord
	acts_as_paranoid

	belongs_to :boardnum

	has_many :dnanums

	has_one :signature, :dependent => :destroy
	has_one :phase, :dependent => :destroy
	has_one :pcr, :dependent => :destroy
  	has_one :eletroforese, :dependent => :destroy
  	has_one :hibrid, :dependent => :destroy
  	has_one :interp, :dependent => :destroy
  	has_one :interpret, :dependent => :destroy
  	has_one :relat, :dependent => :destroy
  	has_one :report, :dependent => :destroy
	has_one :reagent, :dependent => :destroy
	has_one :report, :dependent => :destroy


	validates :identification, presence: true, uniqueness: true
	validates_format_of :identification, :with => /\A\d+\z/

	validate :valid_well
	validate :equal_sample
	validate :valid_ident

	#método que impede o mapa de ser salvo caso os exames ocupem mais de 96 poços na placa
	def valid_well
		kapa = self.dnanums.length
		if kapa > 96
			errors.add(:board, "^Placa teria mais do que 96 poços ocupados.")
		end
	end

	#método que impede um mapa receber cadastros que estão presentes em outros mapas
	def equal_sample
		vars = Board.all 
		vars.each do |rsf|
			rsf.dnanums.each do |ddk|
				self.dnanums.each do |tst|
					if (ddk.id == tst.id) && (rsf.id != self.id)
						errors.add(:board, " não pode conter amostras presentes em outros mapas.")
					end
				end
			end
		end
	end

	#Garantir associação entre o número da placa e o mapa de trabalho
	def valid_ident
		if (self.identification != self.boardnum.identification)
			errors.add(:board,'^Número de placa digitado não corresponde ao selecionado.')	
		end
	end

	#Pesquisa
	def self.search(query)
		joins(:dnanums).where(['boards.identification ILIKE ? or dnanums.code ILIKE ?', "%#{query}%", "%#{query}%"]).order("created_at desc")
	end	

	before_destroy :dont_destroy_record

	private

	def dont_destroy_record
		if (self.created_at.to_date) < (Date.today - 3.days)
		    throw(:abort)
		end
	end
	
end

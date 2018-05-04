class Dnanum < ApplicationRecord	
	has_one :signature, :dependent => :destroy

	belongs_to :exam
	belongs_to :boardnum, optional: true
	belongs_to :board, optional: true
	belongs_to :reagent, optional: true

	validates_presence_of :code, :option, :well, :exam_id, message: 'não pode estar em branco.'
	validates_format_of :code, :with => /\A\d+\z/ #/\A\w+([0-9])\z/
	validates_inclusion_of :option, in: %w( Sim Não ), message: 'não pode estar em branco.'
	validates_inclusion_of :well, in: %w(A1 A2 A3 A4 A5 A6 A7 A8 A9 A10 A11 A12 
										 B1 B2 B3 B4 B5 B6 B7 B8 B9 B10 B11 B12 
										 C1 C2 C3 C4 C5 C6 C7 C8 C9 C10 C11 C12 
										 D1 D2 D3 D4 D5 D6 D7 D8 D9 D10 D11 D12 
										 E1 E2 E3 E4 E5 E6 E7 E8 E9 E10 E11 E12 
										 F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12 
										 G1 G2 G3 G4 G5 G6 G7 G8 G9 G10 G11 G12
	 									 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12), 
	 									 message: 'com endereçamento inadequado.'

	validate :boardnull
	validate :boardwell

	def self.search(query)
		joins(:exams).where(['dnanums.code ILIKE ? or exams.kind ILIKE ?', '%#{query}%', '%#{query}%']).order("created_at desc")
	end	

	def boardnull 
		if self.boardnum_id.blank?
			errors.add(:dnanum, "^A amostra precisa pertencer a uma placa.")
		end
	end

	def boardwell
		dnanums = Dnanum.all
		dnanums.each do |job|
			if (self.well == job.well) && (self.boardnum_id == job.boardnum_id) && (self.id != job.id)
				errors.add(:dnanum, "^Amostra destinada à um poço já ocupado. Escolha outro por favor.")
			elsif (self.code == job.code) && (self.exam_id == job.exam_id) && (self.id != job.id)
				if (self.option == "Não") && (job.option == "Não") && (self.id != job.id)
					errors.add(:dnanum, "^Amostra só pode ser cadastrada com os mesmos detalhes se for para repetição de algum processo.")
				elsif (self.boardnum_id == job.boardnum_id) && (self.id != job.id)
					errors.add(:dnanum, "^Amostra já foi cadastrada nesta placa com o mesmo exame associado.")
				end					
			end
		end
	end

	def code_and_exam
    	"#{code} - #{exam.kind}"
  	end

	before_update :date_exp
	before_destroy :dont_destroy_record

	private

	def date_exp
		#aux = (Date.today - 5.days).to_time(:utc)   strftime("%Y-%b-%d"))
		if (self.created_at.to_date) < (Date.today - 3.days)
			errors.add(:dnanum, "^Período de edição já expirou.")
			throw(:abort)
		end
	end

	def dont_destroy_record
		if (self.created_at.to_date) < (Date.today - 3.days)
		    throw(:abort)
		end
	end
	
end

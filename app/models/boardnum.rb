class Boardnum < ApplicationRecord
	has_many :dnanum
	has_one :board, :dependent => :destroy

	validates :identification, presence: true, uniqueness: true
	validates_format_of :identification, :with => /\A\w+([0-9])\z/

	#Pesquisa
	def self.search(query)
		where(['boardnums.identification ILIKE ?', "%#{query}%"])
	end

	#Evitar que uma placa que contém amostras seja deletada.
	before_destroy :dont_destroy_num

	private

	def dont_destroy_num
		dnanums = Dnanum.all
		dnanums.each do |qwer|
			if (qwer.boardnum.identification == self.identification)
		    	throw(:abort)
		    end
		end
	end
end

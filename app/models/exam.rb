class Exam < ApplicationRecord
	has_many :dnanums

	validates :kind, presence: true, uniqueness: true
end

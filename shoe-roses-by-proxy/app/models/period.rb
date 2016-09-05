class Period < ApplicationRecord
  has_many :costumes
  has_many :theaters
  has_many :theaters, through: :costumes


accepts_nested_attributes_for :costumes, reject_if: proc { |attributes| attributes['period'].blank? }

validates_uniqueness_of :name
validates :name, presence: true


end
end

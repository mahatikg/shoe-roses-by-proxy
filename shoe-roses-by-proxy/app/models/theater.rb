class Theater < ApplicationRecord
  
  has_many :costumes
  has_many :periods, through: :costumes


  accepts_nested_attributes_for :costumes, reject_if: proc { |attributes| attributes['title'].blank? }


end

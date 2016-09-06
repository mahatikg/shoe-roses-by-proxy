class Period < ApplicationRecord
  has_many :costumes
  has_many :theaters
  has_many :theaters, through: :costumes







end

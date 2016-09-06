class Theater < ApplicationRecord

  has_many :costumes
  has_many :periods, through: :costumes




end

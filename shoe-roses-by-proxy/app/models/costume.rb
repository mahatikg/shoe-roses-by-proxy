class Costume < ApplicationRecord
  belongs_to :period
  belongs_to :theater



    # 
    # validates_attachment_content_type :painting_image, content_type: /\Aimage\/.*\z/
    # validates :title, presence: true
    #
    # def artist_name
    #   self.artist.name
    # end


end

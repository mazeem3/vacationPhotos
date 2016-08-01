class Photo < ApplicationRecord
    belongs_to :user
    belongs_to :vacation
  
    attachment :photo, content_type: ['image/jpeg', 'image/png', 'image/gif']
end

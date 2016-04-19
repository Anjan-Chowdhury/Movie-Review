class Movie < ActiveRecord::Base
	belongs_to :user
	
    validates :title, presence: { strict: true }
    validates :movie_length, numericality: true, length: { maximum: 3 }, presence: { strict: true }
    validates :rating, numericality: true, length: { maximum: 2 }, presence: { strict: true }
    validates :director, presence: { strict: true }
    after_validation :rating_can_not_be_more_than_10, :on => [ :create, :update  ]
    
 def rating_can_not_be_more_than_10

    	if rating.to_i > 10 || rating.to_i < 0
    		errors.add(:rating, "rating must be with in 0 to 10")
    	end 
    end

end

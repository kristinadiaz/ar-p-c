class Dish < ActiveRecord::Base
    has_many :ratings
    has_many :users, through: :ratings

    def leave_rating(user, score, reason, recommended_price)
        Rating.create(
            score: score,
            reason: reason,
            recommended_price: recommended_price,
            user_id: User.all.sample.id,
            dish_id: self.id 
        )
    end

    def print_all_ratings
        self.ratings.each do |r|
           puts r.print_rating
        end
    end

    def average_rating
        self.ratings.average(:score).to_f
    end

    def is_dish_popular
        self.average_rating > 5
    end
    
end
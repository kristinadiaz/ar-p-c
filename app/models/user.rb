class User < ActiveRecord::Base
    has_many :ratings
    has_many :dishes, through: :ratings

    def favorite_dish
        self.ratings.order(score: :desc).limit(1).first.dish

        self.ratings.order(:score).last.dish

        self.ratings.sort_by {|r| r.score}.reverse.first.dish 
    end

    def remove_ratings(dish)
        self.ratings.where('dish_id = ?', dish.id).destroy_all
    end
end
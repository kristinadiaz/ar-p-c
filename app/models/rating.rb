class Rating < ActiveRecord::Base 
    belongs_to :user 
    belongs_to :dish 

    def print_rating
        puts "Rating for #{dish.name} by #{user.name}: #{score}. Becuase, #{reason}"
    end
end
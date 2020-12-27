module RacketsHelper
    def avg_stars(racket)
        if racket.reviews.count < 1
        content_tag ("Not yet reviewed.")
        else
        content_tag ("Average review is #{racket.reviews.average(:stars).to_i} stars.")
        end    
    end
end

module RacketsHelper
    def avg_stars(racket)
          stars = racket.reviews.average(:stars).to_i
          content_tag ("Average Review #{stars}s")     
    end
end

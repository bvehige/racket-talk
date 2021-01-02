module ReviewsHelper
    def display_header(review)
        if params[:racket_id]
            content_tag(:h1, "Add a Review for #{review.racket.racket_name} -  #{review.racket.brand.name}")
        else
          content_tag(:h1, "Create a review")
        end
      end
end

module ReviewsHelper
  def format_average_stars(movie)
    if movie.average_stars.nil?
      content_tag(:strong, "No Reviews")
    else
      pluralize(number_with_precision(movie.average_stars, precision:1), 'star')
    end
  end
end

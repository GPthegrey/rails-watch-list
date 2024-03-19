if @review.persisted?
  json.inserted_item render("lists/form", formats: :html, locals: { review: @review })
  json.form render("lists/review", formats: :html, locals: { review: Review.new })
else
  json.form render("lists/review", formats: :html, locals: { review: @review })
end

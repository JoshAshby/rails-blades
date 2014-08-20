json.(review, :id, :product_id, :comments, :overall_rating, :face_feel, :shaving_feel)
json.updated_at review.reviewed_on.to_datetime.to_i

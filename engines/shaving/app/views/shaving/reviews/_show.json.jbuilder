json.(review, :id, :product_id, :comments, :overall_rating, :face_feel, :shaving_feel)
json.updated_at review.updated_at.to_i

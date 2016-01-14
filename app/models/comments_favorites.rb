class CommentsFavorites < ActiveRecord::Base
  belongs_to :comment
  belongs_to :favorite
end

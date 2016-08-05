class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :by
end

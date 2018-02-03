module Campusero
  class MuralSerializer < ActiveModel::Serializer
    attributes :id,
               :username,
               :description,
               :created_at
  end
end

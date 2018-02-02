module Campusero
  class EvaluationSerializer < ActiveModel::Serializer
    attributes :id,
               :slug,
               :username,
               :note
  end
end

module Campusero
  class CheckinSerializer < ActiveModel::Serializer
    attributes :id,
               :username,
               :slug
  end
end

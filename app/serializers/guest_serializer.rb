class GuestSerializer < ActiveModel::Serializer
  attributes :id, :name, :number_of_guests, :reception, :international, :inviter
end

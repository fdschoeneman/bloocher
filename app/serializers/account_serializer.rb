class AccountSerializer < ActiveModel::Serializer
  attributes :id, :accountable_id, :accountable_type, :subdomain
end

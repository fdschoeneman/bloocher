class AuthenticationSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :provider, :uid, :uname, :uemail
end

class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

 # belongs_to :kind, optional: true

  belongs_to :kind, optional: true do
    link(:related) { kind_url(object.id) }
  end
  has_many :phones
  has_one :address

 # link(:self) { contact_url(object.id) }

  def birthdate
    # I18n.l(object.birthdate.to_time.iso8601, format: :default)
    object.birthdate.to_time.iso8601 unless object.birthdate.blank?
  end
end

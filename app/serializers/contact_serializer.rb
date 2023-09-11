class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind, optional: true do
    link(:related) { contact_kind_url(object.id) }
  end

  has_many :phones do
    link(:related){ contact_phones_url(object.id) }
  end

  has_one :address do
    link(:related) { contact_address_url(object.id) }
  end

  def birthdate
    # I18n.l(object.birthdate.to_time.iso8601, format: :default)
    object.birthdate.to_time.iso8601 unless object.birthdate.blank?
  end
end

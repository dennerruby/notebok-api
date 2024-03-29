class Contact < ApplicationRecord
  belongs_to :kind, optional: true
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :address, update_only: true
  accepts_nested_attributes_for :phones, allow_destroy: true
  # def author
  #   "Teste Author"
  # end

  # def kind_description
  #   self.kind.description
  # end

  # def as_json(options={})
  #   super(
  #     root: true,
  #     methods: [:kind_description, :author]
  #   )
  # end
end

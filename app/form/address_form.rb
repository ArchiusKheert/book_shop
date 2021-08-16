class AddressForm < Rectify::Form
  attribute :first_name, String
  attribute :last_name, String
  attribute :address, String
  attribute :city, String
  attribute :country, String
  attribute :zip, String
  attribute :phone, String

  validates :first_name, :last_name, :city, :country,
            presence: true,
            format: { with: /\A[a-zA-Z \-\,]*\z/,
                      message: "Consist of a-z, A-Z, 0-9, ',', '-', ' ' only, no special symbols"},
            length: {maximum:  50}

  validates :zip,
            presence: true,
            format: { with: /\A[0-9\-]*\z/,
                      message: "Consist of 0-9, '-' no special symbols"},
            length: {maximum: 10}

  validates :phone,
            presence: true,
            format: { with: /\A\+[0-9]*\z/,
                      message: "Consist only of 0-9 no special symbols"},
            length: {maximum: 15}
end
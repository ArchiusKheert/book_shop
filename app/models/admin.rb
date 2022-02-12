class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  attr_accessor :skip_password_validation

  validates :email,
            presence: true,
            format: { with: /@/,
                      message: 'invalid format'}

  validates :password,
            format: { with: /\A\S(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\S*\z/i,
                      message: 'should contain at least 1 uppercase, \
                      at least 1 lowercase, at least 1 number and no \
                      whitespaces'},
            unless: :skip_password_validation
end

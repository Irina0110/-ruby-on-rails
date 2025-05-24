class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :values
  has_many :images, through: :values

  EMAIL_REGEX = /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/

  validates :email, presence: true,
                   format: { with: EMAIL_REGEX, message: :invalid },
                   uniqueness: { case_sensitive: false }
  validates :password, presence: true,
                      length: { minimum: 6 },
                      if: :password_required?

  private

  def password_required?
    new_record? || password.present?
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    email = conditions[:email].to_s.strip.downcase
    if email.blank?
      return nil
    end
    where("lower(email) = ?", email).first
  end
end

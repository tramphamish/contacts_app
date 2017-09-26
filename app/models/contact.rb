class Contact < ApplicationRecord
  belongs_to :user
  has_many :contact_group

  def friendly_updated_at
    updated_at.strftime("%b %e, %l:%M %p")
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def japan_code
    "+81 #{phone_number}"
  end

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

end
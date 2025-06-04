class User < ApplicationRecord
    has_many :microposts
    validate :validate_email_format
    validates :name, presence: { message: "Ten khong duoc de trong" }
    validates :email, presence: true

    private

    def validate_email_format
        if email.blank?
            errors.add(:email, "Email khong duoc de trong")
        elsif !email.include?('@')
            errors.add(:email, "Email phai chua ky tu @")
        elsif !email.match(/\A[^@\s]+@[^@\s]+\z/)
            errors.add(:email, "Email khong dung dinh dang")
        end
    end
end

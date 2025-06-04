class User < ApplicationRecord
    has_many :microposts, dependent: :destroy
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true,
                     uniqueness: { case_sensitive: false },
                     length: { maximum: 255 },
                     format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

    before_save :downcase_email

    private

    def downcase_email
        self.email = email.downcase if email.present?
    end
end

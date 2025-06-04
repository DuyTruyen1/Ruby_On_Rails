class Micropost < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 140 }
  validate :validate_content
  
  private
  
  def validate_content
    if content.blank?
      errors.add(:content, "Noi dung khong duoc de trong")
    elsif content.length < 10
      errors.add(:content, "Noi dung phai co it nhat 10 ky tu")
    elsif content.length > 1000
      errors.add(:content, "Noi dung khong duoc vuot qua 1000 ky tu")
    end
  end
end

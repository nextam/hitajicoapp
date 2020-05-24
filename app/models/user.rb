class User < ApplicationRecord
    mount_uploader :image, ImageUploader

    validates :name, {presence: true}
    validates :image, {presence: true}
    validates :birthday, {presence: true}

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :mail, presence: true, uniqueness: true, format:{with: VALID_EMAIL_REGEX }
    validates :password, presence: true, length: { minimum: 5 }

    def posts
        return Post.where(userid: self.id)
    end
end

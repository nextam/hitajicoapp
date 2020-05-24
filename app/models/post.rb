class Post < ApplicationRecord
    mount_uploader :image, ImageUploader

    validates :title, {presence: true}
    validates :image, {presence: true}
    validates :starttime, {presence: true}
    validates :endtime, {presence: true}
    validates :category, {presence: true}
    validates :content, {presence: true}

    def user
        return User.find_by(id: self.userid)
    end
end

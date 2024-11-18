class Shizen < ApplicationRecord
    mount_uploader :image, ImageUploader
    mount_uploader :yokogazou, YokogazouUploader
    mount_uploader :tategazou2, Tategazou2Uploader
    mount_uploader :yokogazou2, Yokogazou2Uploader
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    scope :sort_good, ->{order(like: :desc)}
    scope :sort_new, ->{order(created_at: :desc)}
    scope :sort_old, ->{order(created_at: :asc)}
end
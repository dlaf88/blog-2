class Post < ActiveRecord::Base
  include Bootsy::Container
  mount_uploader :post_image, PostImageUploader
  extend FriendlyId
  
  friendly_id :title, use: :slugged
end

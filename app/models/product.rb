class Product < ActiveRecord::Base

  has_many :cat_relationships, dependent: :destroy
  has_many :categories, through: :cat_relationships

  has_attached_file :image, :styles => { :mega => "360x360>", :large => "260x260>", :medium => "190x190>", :mini => "80x80>" },
    :path   => ":rails_root/public/assets/uploads/product/:id/:id_:style.:extension",
    :url    => "/assets/uploads/product/:id/:id_:style.:extension"

  validates_attachment :image, :presence => true,
    :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    :size => { :in => 0..10.megabytes }

  crop_attached_file :image, :aspect => "1:1"



end

class Post < ActiveRecord::Base
  validates  :title, :presence=>true , :uniqueness =>true
  validates  :content, :presence=>true
  has_many :comments
  
  has_many :attachments, :as => :attachmentable
  
  has_many :taggings
  has_many :tags, :through => :taggings
  
  
  scope :tag_with, lambda{|tag_name| joins(:tags).where("tags.name =?",tag_name)}
  scope :latter_than, lambda{|time| joins(:tags).where("taggings.created_at >?",time)}
  
end

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes['name'].blank? }
  validates_presence_of :name, :content

  # def tags_attributes=(hash)
  #   hash.each do |nested_hash|
  #     if nested_hash[:name] != ""
  #       tag = Tag.find_or_create_by(name: nested_hash[:name])
  #       self.post_tags.build(:tag => tag)
  #     end
  #   end
  # end


end

class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title, :tags_attributes, :publish_at, :visible
  attr_accessor :scheduled_job

  validates :publish_at,:name,:title, :presence => true
  validates :title, :length => { :minimum => 5 }

  has_many :comments, :dependent => :destroy
  has_many :tags

  accepts_nested_attributes_for :tags, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? {|k,v|v.blank?}}


  def self.getVisible(visibility)
      find(:all, :conditions => ['visible = ?', visibility])
    end

end

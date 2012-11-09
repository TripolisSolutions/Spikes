
require 'roar/representer/feature/client'
class Article
  include Roar::Representer::JSON
  include Roar::Representer::Feature::HttpVerbs

  attr_accessor :id, :title, :body, :published
  
  include ArticleRepresenter
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  def persisted?
    !new?
  end

  def new?
    !id
  end

  def self.all
    Articles.get("http://127.0.0.1:3000/articles.json", "application/json").try(:articles)
  end

  def self.find(id)
    Article.get("http://127.0.0.1:3000/articles/#{id.to_i}.json", "application/json")
  end

  # TODO: It's just basic attribute updating

  def assign_attributes(attrs)
    attrs.each_pair do |k, v|
      self.send("#{k}=", v)
    end
  end

  def update_attributes(attrs)
    assign_attributes(attrs)
    save
  end

  def save
    if new?
      post("http://127.0.0.1:3000/articles.json", "application/json")
    else
      put("http://127.0.0.1:3000/articles/#{self.id}.json", "application/json")
    end
  end

  def destroy
    delete("http://127.0.0.1:3000/articles/#{self.id}.json", "application/json")
  end
end

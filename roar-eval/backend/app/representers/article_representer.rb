require 'roar'

module ArticleRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia

  property :id
  property :title
  property :body
  property :published

  link :self do
    article_url(id)
  end
end

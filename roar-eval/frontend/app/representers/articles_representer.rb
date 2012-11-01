module ArticlesRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia

  collection :articles, class: Article

  def articles
    each
  end

  link :self do
    articles_url
  end
end

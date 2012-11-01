class Articles
  attr_accessor :articles

  include Roar::Representer::JSON
  include Roar::Representer::Feature::HttpVerbs

  include ArticlesRepresenter
end

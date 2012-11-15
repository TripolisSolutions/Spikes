class Page_info

  PROPERTIES = [:title, :description, :images]

  attr_reader :url, :title, :description, :images
  attr_writer :title, :description, :images

  def initialize(url)
    @url = url
    @images = Array.new
  end

end
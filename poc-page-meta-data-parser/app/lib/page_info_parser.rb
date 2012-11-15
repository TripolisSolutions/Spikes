require 'open-uri'

class Page_info_parser

  attr_reader :page_info

  def initialize(url)
      @doc = open(url) { |f| Hpricot(f) }
      unless @doc.nil?
        @page_info = Page_info.new(url)
        @page_info.images = Array.new
        fetch_title
        fetch_description
        fetch_images
      end
  end

  def fetch_title
    open_graph_title_element = @doc.search("/html/head/meta[@property='og:title']")
    if !open_graph_title_element.nil? && open_graph_title_element.size > 0
      @page_info.title = open_graph_title_element.attr("content")
    else
      html_title = @doc.at("title").inner_html
      @page_info.title = html_title if html_title
    end
  end

  def fetch_description
    open_graph_description_element = @doc.search("/html/head/meta[@property='og:description']")
    if !open_graph_description_element.nil? && open_graph_description_element.size > 0
      @page_info.description = open_graph_description_element.attr("content")
    else
      @page_info.description = @doc.search("//meta[@name='description']").first['content']
    end
  end

  def fetch_images
    images = Array.new
    open_graph_image_elements = @doc.search("/html/head/meta[@property='og:image']")
    if !open_graph_image_elements.nil? && open_graph_image_elements.size > 0
      open_graph_image_elements.each do |open_graph_image_element|
        validate_and_add_image(open_graph_image_element.attributes['content'])
      end
    else
      image_tags = @doc.search("/html/body//img")
      image_tags.each do |image_tag|
        validate_and_add_image(image_tag.attributes['src'])
      end
    end
    return images
  end

  def validate_and_add_image(src)
    image_size = FastImage.size(src)
    unless (src.nil? || image_size.nil?)
      width = image_size[0]
      height = image_size[1]
      unless (width < 50 || height < 50)
        image = Image.new(src,width,height)
        @page_info.images.push(image)
      end
    end
  end

end
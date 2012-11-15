require 'open-uri'

class PageInfoParser

  attr_reader :page_info

  def initialize(url)
      @url = url
      @doc = open(@url) { |f| Hpricot(f) }
      unless @doc.nil?
        @page_info = PageInfo.new(@url)
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
      description_meta_tag_elements = @doc.search("//meta[@name='description']")
      if (!description_meta_tag_elements.nil? && description_meta_tag_elements.size > 0)
        @page_info.description = description_meta_tag_elements.first['content']
      end
    end
  end

  def fetch_images
    images = Array.new
    open_graph_image_elements = @doc.search("/html/head/meta[@property='og:image']")
    if !open_graph_image_elements.nil? && open_graph_image_elements.size > 0
      open_graph_image_elements.each do |open_graph_image_element|
        src = open_graph_image_element.attributes['content']
        validate_and_add_image(Image.new(src))
      end
    else
      image_tags = @doc.search("/html/body//img")
      image_tags.each do |image_tag|
        image_url = fix_relative_paths(image_tag.attributes['src'])
        image = Image.new(image_url)
        image.width = image_tag.attributes['width'].to_s.to_i if image_tag.attributes['width']
        image.height = image_tag.attributes['height'].to_s.to_i if image_tag.attributes['height']
        validate_and_add_image(image)
      end
    end
    return images
  end

  def fix_relative_paths(image_url)
    if image_url.start_with?"http"
      image_url
    else
      URI.join(@url, image_url).to_s
    end
  end

  def validate_and_add_image(image)
    if image.width == 0 || image.height == 0
        image.width, image.height =  FastImage.size(image.url)
    end
    @page_info.images.push(image) if min_size?(image) && max_ratio?(image)
  end

  def min_size?(image)
    image.width > 49 || image.height > 49
  end

  def max_ratio?(image)
    image.width.to_f / image.height <= 3
  end

  def get_image_dimension(url)

  end

end
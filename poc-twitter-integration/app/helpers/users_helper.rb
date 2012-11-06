module UsersHelper
# Returns the Avatar URL for the given user
  def avatar_for(user, options = {size: 50})
    image_tag(user.avatarUrl, alt: user.name, class: "avatar", height: options[:size], width:options[:size])
  end

  def profile_link_for(user, text, options = {class: ""})
    link_to(text, "http://twitter.com/#{user.name}", class: options[:class])
  end
end
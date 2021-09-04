module ApplicationHelper
  def gravatar_for(user, options = { size: 80})
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
  end

  # def user_avatar(user, size=50)
  #   if user.avatar.attached? 
  #     user.avatar.attachment.variant(resize: "#{size}×#{size}!")
  #   else
  #     'https://randomuser.me/api/portraits/women/49.jpg'
  #   end
  # end

  
  
end

module UsersHelper
	def avatar_for(user, options = {size: 80})
		size = options[:size]
		if user.avatar?
			image_tag user.avatar.url(:thumb), size: size, class: 'avatar_img'
		else
			image_tag "cat.jpg", size: size, class: 'avatar_img'
		end
	end
end
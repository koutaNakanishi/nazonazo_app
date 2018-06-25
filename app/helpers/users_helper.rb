module UsersHelper

	def gravatar_for(user,options={size:280})#リネームが面倒なので、ユーザアイコンはこｒで。
		#gravatar_id=Digest::MD5::hexdigest(user.login_id.downcase)
		#size=options[:size]
		#gravatar_url="https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		#image_tag(gravatar_url,alt:user.name,class:"gravatar")
		size=options[:size]
		image_tag(user.image,alt: user.name,class: "gravatar")
	end
end

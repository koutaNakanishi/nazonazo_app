module ApplicationHelper
	def full_title(page_title = '')
		base_title="Ruby on Rails Tutorial Sample App"
			if page_title.empty?
				base_title
			else
				page_title+" | "+base_title
			end
		end

	def ac?(user,nazo)
		res=user.relationships.find_by(nazo_id: nazo.id)
#		debugger
		return false if res==nil || res.ac==false
		return true
	end
	
	def wa?(user,nazo)
		res=user.relationships.find_by(nazo_id: nazo.id)
		return false if res==nil || res.ac==true
		return true
	end

end

module ApplicationHelper

	def flash_message(klass, message)
	  klass = 'success' if klass == 'notice' || klass == 'alert'
	  flash.discard(klass)
	  content_tag :article, class: "alert alert-#{klass}" do
	    concat close_button(:alert)
	    concat message
	  end
	end

	def flash_messages
	  flash.map do |type, message|
	    flash_message(type, message)
	  end.join.html_safe
	end
	
	def close_button(target = :modal)
	  link_to '&times;'.html_safe, '', class: :close, data: {dismiss: target}
	end
end

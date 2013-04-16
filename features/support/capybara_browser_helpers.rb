module CapybaraBrowserHelpers
	def self.get_url_path(url)
	  uri = URI.parse(url)
	  
	  if uri.query
	    "#{uri.path}?#{uri.query}"
	  else
	    "#{uri.path}"
	  end
	end
end
World(CapybaraBrowserHelpers)
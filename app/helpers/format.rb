 helpers do
 	
 	def format_dollars(integer)
  		integer.to_s.split('').unshift('$').insert(-3, '.').join
  	end

end

 helpers do
 	
 	def dollars_to_int(str)
 		str.gsub(/[$.]/,'').to_i
	end
 	
 	def int_to_dollars(int)
  		int.to_s.split('').unshift('$').insert(-3, '.').join
  	end
end

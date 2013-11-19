helpers do 
  
  def raise_errors(input)
    input.valid?
    session[:errors] = input.errors.messages
  end

end
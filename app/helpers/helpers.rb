helpers do

  def create_errors(input_object)
    input_object.valid?
    session[:errors] = input_object.errors.messages
  end

end

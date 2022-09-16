class InvalidParameterError < StandardError
  attr_accessor :api_error_messages

  def initialize(api_error_messages)
    @api_error_messages = api_error_messages
  end
end

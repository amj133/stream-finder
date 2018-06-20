class StreamflowMailer < ApplicationMailer
  default from: 'app93362195@heroku.com'

  def historical_streamflow(email, streamflow)
    @streamflow = streamflow
    binding.pry

    mail to: email, subject: 'Historical Streamflow'
  end

end

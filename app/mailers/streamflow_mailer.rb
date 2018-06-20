class StreamflowMailer < ApplicationMailer
  default from: 'app93362195@heroku.com'

  def historical_streamflow(email, time, discharge)
    @time = time
    @discharge = discharge

    mail to: email, subject: 'Historical Streamflow'
  end

end

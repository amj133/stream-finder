class StreamflowMailer < ApplicationMailer
  default from: 'frankyrocksallday@gmail.com'

  def historical_streamflow(user, streamflow)
    @streamflow = streamflow

    mail to: 'amj@vt.edu', subject: 'Historical Streamflow'
  end

end

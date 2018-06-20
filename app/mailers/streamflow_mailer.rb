class StreamflowMailer < ApplicationMailer
  default from: 'app93362195@heroku.com'

  def historical_streamflow(email, time, discharge, site_id)
    @time = time
    @discharge = discharge
    @site_id = site_id

    mail to: email, subject: 'Historical Streamflow'
  end

end

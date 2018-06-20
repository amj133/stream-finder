class SendStreamflowEmailJob < ApplicationJob
  queue_as :default

  def perform(email, time, discharge, site_id)
    StreamflowMailer.historical_streamflow(email, time, discharge, site_id).deliver_now
  end
end

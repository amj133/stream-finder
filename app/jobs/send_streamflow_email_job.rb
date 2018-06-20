class SendStreamflowEmailJob < ApplicationJob
  queue_as :default

  def perform(email, time, discharge)
    StreamflowMailer.historical_streamflow(email, time, discharge).deliver_now
  end
end

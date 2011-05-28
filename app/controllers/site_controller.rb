class SiteController < ApplicationController 
  include ActiveMerchant::Billing::Integrations::ActionViewHelper
  
  def form  
  end
  
  def test 
  end 
  
  def notify
    notify = EPaymentPlan::Notification.new(request.raw_post)
    if notify.acknowledge 
      Rails.logger.info("OK")
      render :text => "ok"
    else
      debugger
      Rails.logger.info("ERROR")
      render :text => "error"
    end
  end
  
  def done
  end
  
end
class SiteController < ApplicationController 
  include ActiveMerchant::Billing::Integrations::ActionViewHelper
  
  def form  
  end
  
  def test 
  end 
  
  def notify
    notify = ActiveMerchant::Billing::Integrations::EPaymentPlan::Notification.new(request.raw_post)
    Rails.logger.info "Llegue a Tiendafy: SiteController#notify"
    allowed = notify.acknowledge
    Rails.logger.info "Termine acknowledge: Order#notify_store"
    if allowed
      Rails.logger.info("OK")
      render :text => "ok"
    else
      Rails.logger.info("ERROR")
      render :text => "error"
    end
  end
  
  def done
  end
  
end
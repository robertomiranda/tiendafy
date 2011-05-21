class SiteController < ApplicationController 
  include ActiveMerchant::Billing::Integrations::ActionViewHelper
  
  def form  
  end
  
  def test 
  end 
  
  def notify
    render :text => params.inspect
  end
  
end
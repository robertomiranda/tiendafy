class SiteController < ApplicationController 
  include ActiveMerchant::Billing::Integrations::ActionViewHelper
  
  def form  
  end
  
  def test 
  end 
  
  def notify
  end
  
end
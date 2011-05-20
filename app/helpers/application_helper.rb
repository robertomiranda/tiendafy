module ApplicationHelper
  def payment_service_for(order, account, options = {}, &proc)          
      raise ArgumentError, "Missing block" unless block_given?

      integration_module = ActiveMerchant::Billing::Integrations.const_get(options.delete(:service).to_s.camelize)

      result = []
      result << form_tag(integration_module.service_url, options.delete(:html) || {})
      
      service_class = integration_module.const_get('Helper')
      service = service_class.new(order, account, options)

      result << capture(service, &proc)

      service.form_fields.each do |field, value|
        result << hidden_field_tag(field, value)
      end
     
      result << '</form>'
      result= result.join("\n")
      
      concat(result.respond_to?(:html_safe) ? result.html_safe : result)
      nil
    end
end

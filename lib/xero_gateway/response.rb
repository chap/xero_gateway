module XeroGateway
  class Response
    attr_accessor :response_id, :status, :errors, :provider, :date_time, :response_item, :request_params, :request_xml, :response_xml
    
    alias_method :invoice, :response_item
    alias_method :invoices, :response_item
    alias_method :contact, :response_item
    alias_method :contacts, :response_item
    alias_method :accounts, :response_item
    alias_method :tracking_categories, :response_item
    alias_method :organisation,  :response_item
    alias_method :tax_rates,     :response_item
    alias_method :currencies,    :response_item
    
    def initialize(params = {})
      params.each do |k,v|
        self.send("#{k}=", v)
      end
      
      @errors ||= []
      @response_item ||= []
    end    
    
    def success?
      status == "OK"
    end
    
    def error
      errors.blank? ? nil : errors[0]
    end
  end
end

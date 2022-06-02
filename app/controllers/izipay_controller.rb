require 'rubygems'
require 'excon'

class IzipayController < ApplicationController

  def index

    request = {
      "amount" => 100,
      "currency" => "PEN",
      "customer" => {
        "email" => "sample@example.com"
      },
      "orderId" => "myOrderId-787199"
    }

    response = Excon.post('https://api.micuentaweb.pe/api-payment/V4/Charge/CreatePayment',
      :body => request.to_json,
      :headers => {      
        "Content-Type" => "application/json",
        "Authorization" => "Basic NTE0NDczNzg6dGVzdHBhc3N3b3JkXzZBZnN6cktnVVVNbXd1eGtZTTU0b0s3RlJKdU1JVEE5NHloYlFORmtuZGswMw=="
      });
    
    jsonResponse = JSON.parse(response.body);
    @formToken = jsonResponse["answer"]["formToken"];

  end
end

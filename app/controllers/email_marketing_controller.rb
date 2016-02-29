class EmailMarketingController < ApplicationController
  def stats
    @title = "Email Stats"
  end

  def get_stats
    url_params = Multimap.new
    url_params[:duration] = "1m"
    url_params[:event] = "accepted"
    url_params[:event] = "delivered"
    url_params[:event] = "failed"
    query_string = url_params.collect {|k, v| "#{k.to_s}=#{CGI::escape(v.to_s)}"}.
      join("&")
    RestClient.get "https://api:YOUR_API_KEY"\
    "@api.mailgun.net/v3/YOUR_DOMAIN_NAME/stats/total?#{query_string}"
  end

end

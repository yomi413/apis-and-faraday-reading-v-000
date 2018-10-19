class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = 'CLTC410S5B52YKD2H0FOXWPHK0BQFYIOWLABFYFJEODASV4W'
      req.params['client_secret'] = 'TPESMTVRRCSAO4W2SKLAABOWAP3IRWJBDFGGCNM34FWLVC0N'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
    render 'search'
  end
end

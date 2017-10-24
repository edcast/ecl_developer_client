
class BaseCommunicator
  attr_accessor :response_data,:token,:client_id,:payload

  def initialize(client_id,token,payload={})
    @payload = payload
    @token = token
    @client_id = client_id
  end

  def headers
    {
      "X-Api-Token" => @token,
      "X-Api-Client" => @client_id
    }
  end

 
  def base_url
    EclClient.configuration.ecl_app_url
  end

 
  def establish_connection(relative_url, params={})
    conn = Faraday.new(base_url)
    @response = conn.get do |req|
      req.url relative_url
      req.headers = headers
      req.params = params
    end
  end

  def establish_post_connection(relative_url, params={})
    conn = Faraday.new(base_url)

    @response = conn.post do |req|
      req.url relative_url
      req.headers = headers
      req.body = params
    end
  end

  def establish_put_connection(relative_url, params={})
    conn = Faraday.new(base_url)

    @response = conn.put do |req|
      req.url relative_url
      req.headers = headers
      req.body = params
    end
  end

  def establish_delete_connection(relative_url, params={})
    conn = Faraday.new(base_url)

    @response = conn.delete do |req|
      req.url relative_url
      req.headers = headers
      req.body = params
    end
  end

  def response_data
    JSON.parse(@response.body)
  end

  def error
    (response_data["error"] || response_data["message"]).try(:humanize)
  end
end

module EclDeveloperClient
  class ContentItem < EclDeveloperClient::BaseCommunicator

     def create(options = {})
      params = options
      establish_post_connection('content_items', params)
    end

    def get(options = {})
      params = options
      params[:limit]  = options[:limit]  || 20
      params[:offset] = options[:offset] || 0
      establish_post_connection('content_items/search', params)
    end

    def delete(content_id)
      establish_delete_connection("content_items/#{content_id}")
    end

    def find(content_id)
      establish_connection("content_items/#{content_id}")
    end

  end
end

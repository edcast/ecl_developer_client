module EclDeveloperClient
  class Source < EclDeveloperClient::BaseCommunicator

  # @param [Hash] query
    #   Search Frm Source
    #  {}
    # @return [Base Response]
    def get(options = {})
      params = options
      params[:limit] = options[:limit] || 10
      params[:offset] = options[:offset] || 0
      establish_connection('sources', params)
    end

    def create(options = {})
      params = options
      establish_post_connection('sources', params)
    end

    def find(source_id)
      establish_connection("sources/#{source_id}")
    end

    def update(source_id, options = {})
      params = options
      establish_put_connection("sources/#{source_id}", params)
    end

    def delete(source_id)
      establish_delete_connection("sources/#{source_id}")
    end

    def trigger_collector(source_id)
      establish_post_connection("sources/#{source_id}/trigger_fetch_content_job")
    end

    def delete_content_items(source_id)
      establish_connection("sources/#{source_id}/remove_content_items")
    end

    def refresh_content_items(source_id)
      establish_connection("sources/#{source_id}/refresh_content_items")
    end
  end
end

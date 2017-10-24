module EclDeveloperClient
  class SourceType < EclDeveloperClient::BaseCommunicator
    # @param [Hash] query
    #   Search Frm Source
    #  {}
    # @return [Base Response]
    def get(options = {})
      params = options
      params[:limit] = options[:limit] || 10
      params[:offset] = options[:offset] || 0
      establish_connection('source_types', params)
    end

    def find(source_type_id)
      establish_connection("source_types/#{source_type_id}")
    end

    def create(options = {})
      params = options
      establish_post_connection('source_types', params)
    end

    def update(source_type_id, options = {})
      params = options
      establish_put_connection("source_types/#{source_type_id}", params)
    end

    def delete(source_type_id)
      establish_delete_connection("source_types/#{source_type_id}")
    end

  end
end

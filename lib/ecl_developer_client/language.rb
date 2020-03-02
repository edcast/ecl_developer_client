module EclDeveloperClient
  class Source < EclDeveloperClient::BaseCommunicator
    # @param [Hash] query
    #   Search Frm Source
    #  {}
    # @return [Base Response]
    def get(options = {})
      establish_connection('language_codes', options)
    end
  end
end
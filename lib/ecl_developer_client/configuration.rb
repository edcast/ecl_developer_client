module EclDeveloperClient
  class Configuration
    attr_accessor :ecl_app_url
    def initialize(ecl_app_url=nil)
      @ecl_app_url = ecl_app_url
    end
  end
  class << self
    attr_accessor :configuration
  end
  def self.configure
    self.configuration = Configuration.new
    yield(configuration) if block_given?
  end
end  
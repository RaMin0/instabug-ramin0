module ApiVersions
  def api(options = {}, &block)
    raise 'Please set a vendor_string for the api method' if options[:vendor_string].nil?

    VersionCheck.default_version = options.delete(:default_version)
    VersionCheck.vendor_string   = options.delete(:vendor_string)

    namespace(:api, options) { DSL.new(self, &block) }
  end
end

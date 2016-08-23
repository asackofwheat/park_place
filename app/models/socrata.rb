class Socrata

  def self.get_score(name)
    client = SODA::Client.new({:domain => "data.sfgov.org"})
    response = client.get("urx2-yj58", {"$where" => "park = '#{name.titleize}'"})
    response[0]["park_site_score"] unless response.empty?
  end

  def self.get_info(name)
    client = SODA::Client.new({:domain => "data.sfgov.org"})
    response = client.get("94uf-amnx", {"$where" => "parkname = '#{name.upcase}'"})
    response[0] unless response.empty?
  end

end
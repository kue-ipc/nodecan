module NetworksHelper
  def ip_pools_to_json(ip_pools)
    ip_pools.map do |ip_pool|
      {
        network_type: ip_pool.network_type,
        first: ip_pool.first.to_s,
        last: ip_pool.last.to_s,
      }
    end.to_json
  end
end

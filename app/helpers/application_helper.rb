module ApplicationHelper

  def private_ipv4
    @ip = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}
    return @ip.ip_address
  end

  def remote_ip
    request.remote_ip
  end

end

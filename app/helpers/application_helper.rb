module ApplicationHelper

  def private_ipv4
    @ip = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}
    return @ip.ip_address
  end

end

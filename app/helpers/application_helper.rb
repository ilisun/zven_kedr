module ApplicationHelper

  def private_ipv4
    @ip = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}
    return @ip.ip_address
  end

  def remote_ip
    request.remote_ip
  end

  def remote_city

    if !session[:city]

      uri = URI.parse("http://api.sypexgeo.net/json/#{remote_ip}")

      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.request_uri)

      response = http.request(request)

      if response.code == "200"

        json = JSON.parse(response.body.force_encoding('UTF-8'))
        city = json["city"]["name_ru"]
        session[:city] = city
        return city

      else
        return "Ошибка определиния города"
      end
    else
      return session[:city]
    end
  end


end

require 'sinatra'

get '/' do
  ips = %x{ ifconfig | grep 'inet ' | cut -d ' ' -f 2 }.split("\n")
  @url = "#{ips[1]}:#{request.port}"
  p @url
  haml :index
end



__END__
@@ index
!!!
%html
  %meta{:name => "viewport", :content => "width=320, initial-scale=1.0, maximum-scale=1.0, user-scalable=no /"}
  %body
    %h1
      = @url

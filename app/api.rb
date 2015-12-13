require File.join(File.dirname(__FILE__), 'msinatra')

class Api < MSinatra::Base

  get "/" do
    "home"
  end

  get "/posts" do
    "posts"
  end
end

Api.new

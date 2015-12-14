require File.join(File.dirname(__FILE__), 'msinatra')

class Api < MSinatra::Base

  get "/" do
    "home"
  end

  get "/posts" do
    "posts"
  end

  get "/posts/:id" do |params|
    params[:id]
  end
end

Api.new

require File.join(File.dirname(__FILE__), 'msinatra')

class Api < MSinatra::Base
  before_filter

  get "/" do
    "home"
  end

  get "/posts" do
    "posts"
  end

  get "/posts/:id" do |params|
    post = storage[params['id']]
    "post page #{post[:body]}"
  end
end

Api.new

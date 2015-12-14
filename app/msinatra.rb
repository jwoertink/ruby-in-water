module MSinatra
  class Base
    @@get_routes = []
    @@redis = Hiredis.new

    # This is purely for storing the initial data
    def self.before_filter
      @@redis['1'] = JSON.generate({id: 1, title: 'Test', body: 'this is a test post'})
    end

    def self.get(path, &block)
      @@get_routes << {route: path, body: block, status: 200}
    end

    def self.get_routes
      @@get_routes
    end

    def self.storage
      @@redis
    end

    def call(env)
      path = RouteFinder.new(env).search
      response = Response.new(path, env).body
      [
        path[:status],
        {'Content-Type'   => 'application/json',
         'Content-Length' => response.size},
         [response]
      ]
    end

  end

  class RouteFinder
    def initialize(env)
      @env = env
    end

    # Need to find the route that matches exactly
    #   /posts == /posts
    # or matched with params like
    #   /posts/1 == /posts/:id
    def search
      paths = Base.send("#{@env["REQUEST_METHOD"].downcase}_routes")
      path = paths.find { |k,v| path_matches?(k[:route]) }

      return path || not_found
    end

    private

    def not_found
      {route: '/404', body: -> {'Not Found'}, status: 404}
    end

    def path_matches?(path)
      if path == @env["PATH_INFO"]
        return true
      else
        set1 = path.split('/')
        set2 = @env["PATH_INFO"].split('/')
        params = (set1.reject {|s| set2.include?(s) } + set2.reject {|s| set1.include?(s)}).delete_if(&:empty?)
        if params.size % 2 == 0 && params.any?{|p| p.include?(':')}
          params = Hash[*params.map {|p| p.gsub!(':', '') if p.include?(':'); p}]
          qs = params.to_a.map {|a| a.join('=') }.join('&')
          @env['QUERY_STRING'] = [@env['QUERY_STRING'], qs].join('&')
          return true
        end
      end

      false
    end
  end

  class Response
    def initialize(path, env)
      @path, @env = path, env
    end

    def body
      params = Hash[*@env['QUERY_STRING'].split('&').map {|p| p.split('=') }.flatten]
      @path[:body].call(params)
    end

  end
end

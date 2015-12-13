module MSinatra
  class Base
    @@paths = []

    def self.get(path, &block)
      @@paths << {route: path, body: block.call, status: 200}
    end

    def self.paths
      @@paths
    end

    def call(env)
      paths = self.class.paths
      path = paths.find { |k,v| k[:route] == env["PATH_INFO"] } || not_found
      [
        path[:status],
        {'Content-Type'   => 'application/json',
         'Content-Length' => path[:body].size},
         [path[:body]]
      ]
    end

    private

    def not_found
      {route: '/404', body: 'Not Found', status: 404}
    end

  end
end

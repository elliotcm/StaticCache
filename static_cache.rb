module Middleware
  class StaticCache
    def initialize(app, *directories)
      @app = app
      @directories = directories
    end

    def call(env)
      status, headers, body = @app.call(env)

      headers['Cache-Control'] = "public, max-age=#{days_to_seconds(14)}" if @directories.any? do |directory|
        env['PATH_INFO'] =~ %r(^/#{directory})
      end

      [status, headers, body]
    end

    private
    def days_to_seconds(days)
      days * 24 * 60 * 60
    end
  end
end

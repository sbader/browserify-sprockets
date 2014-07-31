require "sprockets"
require "browserify_sprockets/version"
require "open3"

module BrowserifySprockets
  def self.bootstrap(node_path, load_paths = [])
    Engine.node_path = node_path
    Engine.load_paths = load_paths
    Sprockets.register_engine(".browserify", Engine)
  end

  class Engine
    class << self
      attr_accessor :load_paths
      attr_accessor :node_path
    end

    def initialize(pathname, &block)
      @pathname = pathname
    end

    def render(context, locals)
      data = File.open(context.pathname, 'rb') { |io| io.read }
      browserify_build(context.pathname, data)
    end

    def browserify_build(pathname, data)
      build_script = File.expand_path("../../bin/browserify_build", __FILE__)
      base_directory = File.expand_path(pathname.dirname)

      debug = (ENV['RACK_ENV'] == "production") ? "" : "--debug"

      paths = self.class.load_paths.join(",")

      output = ""

      Open3.popen3({"NODE_PATH" => self.class.node_path}, build_script, debug, paths, base_directory) do |stdin, stdout, stderr|
        stdin.puts data
        stdin.close

        output = stdout.gets(nil)

        unless output
          output = stderr.gets(nil)
        end

        stdout.close
        stderr.close
      end

      output
    end
  end
end


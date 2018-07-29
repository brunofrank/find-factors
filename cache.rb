require 'json'
require 'digest'

class Cache
  CACHE_PATH = "#{Dir.pwd}/.cache".freeze

  def initialize
    Dir.mkdir CACHE_PATH unless File.directory?(CACHE_PATH)
  end

  def get(key)
    JSON.parse(File.read(file_name(key))) if File.exists?(file_name(key))
  end

  def store(key, data)
    File.open(file_name(key), 'w') do |f|
      f.write(JSON.dump(data))
    end
  end

  private

  def file_name(key)
    "#{CACHE_PATH}/#{Digest::MD5.hexdigest(key.join(''))}"
  end
end

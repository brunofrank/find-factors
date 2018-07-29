require 'json'
require 'digest'

class Cache
  CACHE_PATH = "#{Dir.pwd}/.cache".freeze

  def initialize
    Dir.mkdir CACHE_PATH unless File.directory?(CACHE_PATH)
  end

  def find(array)
    File.read(file_name(array)) if File.exists?(file_name(array))
  end

  def save(array, data)
    File.open(file_name(array), 'w') do |f|
      f.write(JSON.dump(data))
    end
  end

  private

  def file_name(data)
    file = Digest::MD5.hexdigest(data.join(''))
    "#{CACHE_PATH}/#{file}"
  end
end

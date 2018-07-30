require_relative '../cache'

RSpec.describe Cache do
  let(:cache) { Cache.new}

  it "has a fullpath cachedir" do
    expect(Cache::CACHE_PATH).to be_kind_of(String)
    expect(Cache::CACHE_PATH).to end_with('find-factors/.cache')
  end

  it "creates the .cache dir when instantiated" do
    expect(File.directory?(Cache::CACHE_PATH)).to be_truthy
  end

  it "tries to get the cache of uncached key" do
    expect(cache.get(['UNCACHED', 'KEY'])).to be_nil
  end

  it "stores a cache and get it" do
    cache.store([1, 2, 3], { 'cached' => true })

    stored_cache = cache.get([1, 2, 3])

    expect(stored_cache).to be_kind_of(Hash)
    expect(stored_cache['cached']).to be_truthy
  end
end

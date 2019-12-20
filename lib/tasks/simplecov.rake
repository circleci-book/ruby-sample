require "simplecov"

namespace :simplecov do
  desc "merge_results"
  task merge_results: :environment do
    SimpleCov.start 'rails' do
      add_filter '/spec/'
      merge_timeout(3600)
    end
    merge_results
  end

  def merge_results
    results = Dir["coverage_results/.resultset-*.json"].map { |file| SimpleCov::Result.from_hash(JSON.parse(File.read(file))) }
    SimpleCov::ResultMerger.merge_results(*results).tap do |result|
      SimpleCov::ResultMerger.store_result(result)
    end
  end
end

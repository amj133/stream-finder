
namespace :test_refresh do
  task delete_cassettes: :environment do
    puts 'Deleting VCR cassettes...'
    FileUtils.rm_rf(Dir.glob("spec/fixtures/cassettes/*"))
    puts "Cassettes deleted"
  end
end


every :sunday, :at => '12am' do
  rake "test_refresh:delete_cassettes", :environment => 'development'
end

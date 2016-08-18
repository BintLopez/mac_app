module Google
  Dir["#{__dir__}/#{File.basename(__FILE__, '.rb')}/*.rb"].each { |file| require file }
end

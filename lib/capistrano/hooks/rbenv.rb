Capistrano::DSL.stages.each do |stage|
  after stage, 'rbenv:validate'
  after stage, 'rbenv:map_bins'
end

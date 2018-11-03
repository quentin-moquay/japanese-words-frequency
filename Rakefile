require 'rake/testtask'
require 'rubocop/rake_task'

task :run, [:limit] do |_t, args|
  ruby "./lib/main.rb #{args[:limit]}"
end

task :release, [:limit] do |_t, args|
  ruby "./lib/main.rb #{args[:limit]}"
  sh 'cp ./out/vocabulary.html ./docs/index.html'
  sh 'cp ./out/main.css ./docs/main.css'
end

RuboCop::RakeTask.new(:rubocop) do |t|
  t.options << '--display-cop-names'
  t.verbose = true
end

Rake::TestTask.new do |t|
  t.libs << 'tests'
  t.test_files = FileList['tests/test*.rb']
  t.verbose = true
end

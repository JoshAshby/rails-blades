require 'shaving/csv_importer'

namespace :data do
  desc "import data from files to database"

  task :import, [:file] => [:environment] do |t, args|
    file = args[:file]

    Shaving::CsvImporter.read file
  end
end

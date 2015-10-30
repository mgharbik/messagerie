module Messagerie
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      desc "Creates migrations files to your application"

      def self.source_root
        File.expand_path("../templates", __FILE__)
      end

      def self.next_migration_number(path)
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      end

      def create_migrations
        Dir["#{self.class.source_root}/migrations/*.rb"].sort.each do |filepath|
          copy_migration File.basename(filepath)
        end
      end

      protected
      def copy_migration(filename)
        if self.class.migration_exists?("db/migrate", "#{filename.chomp(".rb")}")
          say_status("skipped", "Migration #{filename} already exists")
        else
          migration_template "migrations/#{filename}", "db/migrate/#{filename}"
        end
      end
    end
  end
end
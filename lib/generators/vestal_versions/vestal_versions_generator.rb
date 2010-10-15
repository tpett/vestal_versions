# Rails 3 generator
class VestalVersionsGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  source_root File.expand_path('../templates', __FILE__) 
  
  def create_migration_and_initializer
    migration_template 'migration.rb', File.join('db', 'migrate','create_vestal_versions.rb')
    empty_directory 'config/initializers'
    template 'initializer.rb', File.join('config', 'initializers', 'vestal_versions.rb')
  end
  
  # Implement the required interface for Rails::Generators::Migration.
  # taken from http://github.com/rails/rails/blob/master/activerecord/lib/generators/active_record.rb
  # Help from: http://www.themodestrubyist.com/2010/03/16/rails-3-plugins---part-3---rake-tasks-generators-initializers-oh-my/
  def self.next_migration_number(dirname)
   if ActiveRecord::Base.timestamped_migrations
     Time.now.utc.strftime("%Y%m%d%H%M%S")
   else
     "%.3d" % (current_migration_number(dirname) + 1)
   end
  end
end

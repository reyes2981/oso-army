require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride # mounted middleware that allows further CRUD features (patch, delete)

use LogsController
use UsersController
use SessionsController
run ApplicationController

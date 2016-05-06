namespace :users do
  desc 'Creates a new admin user'
  task create_admin_user: :environment do
    user = CreateAdminService.new.call
    puts 'CREATED ADMIN USER: ' << user.email
  end
end

# Create an admin user
admin = User.create(
  email: 'admin@example.com',
  password: 'admin_password',
  password_confirmation: 'admin_password',
  role: 'admin'
)

# Create a regular user
user = User.create(
  email: 'user@example.com',
  password: 'user_password',
  password_confirmation: 'user_password',
  role: 'regular'
)

# Create three vehicles
vehicle1 = Vehicle.create(
  name: 'Vehicle 1',
  current_state: 'designed',
  acceptable_pattern: ['designed', 'assembled', 'painted', 'tested']
)

vehicle2 = Vehicle.create(
  name: 'Vehicle 2',
  current_state: 'designed',
  acceptable_pattern: ['designed', 'assembled', 'painted', 'tested']
)

vehicle3 = Vehicle.create(
  name: 'Vehicle 3',
  current_state: 'designed',
  acceptable_pattern: ['designed', 'assembled', 'painted', 'tested']
)

puts 'Seed data created successfully.'

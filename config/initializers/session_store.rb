# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ddsmate_session',
  :secret      => '2112939a6e5dad358601e723a549769b43ac4250316f987ed51f19db5610b684cfddcc1872b0a9c6a2dbf21cb14ec3a2a8ea6a393c7d68c253a7d6ccb52fddc8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

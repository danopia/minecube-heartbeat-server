# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_heartbeat-server_session',
  :secret      => '6a4b5cf174c36de2a7fa488f9f3938081020d28753bcdadfa4f7cf8330e6758eaabd4243e4002d2633786b084a8427c8dcd46392ac641079eb3f2d795bbe0e0a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_SAITC_session',
  :secret      => 'abc832ad1ff23df10cda00df6c482c29a2c42879e40c7a9c4df701842418a7a7099fae36bd78cbbcf81a6ad17bb44320167e4a91819e78f3326f4ff9314999ab'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

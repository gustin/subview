# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_subView_session',
  :secret      => '9cd48205f0b885cd1aeae34b47befa1ea668647e41372725007ab687b8c29c644ffe553f15c7cdf00f98cb94e2b2bf8a10baef49bc8bafd07e5461d782e437d3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

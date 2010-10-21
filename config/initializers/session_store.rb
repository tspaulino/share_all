# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_share_all_session',
  :secret      => 'e6d686920ec31a6baeab80063245ffeb64176feb42bad64f0eb1ca28329c812a33908efcdab37874d2b9cd8edff50b7429191a76170f32fa0423aea733aa78a2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

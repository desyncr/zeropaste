# Required: generate with `bundle exec secret`
#
CONFIG['secret_key'] = '#@$TSEYJERYDJ$@#%#$^$%F#{?F#{?{$?@#{V#{?$V@{#?$V{@#?V#}}}}}}}'

# Set to false if you want to use different web server (e.g. passenger)
# Default is set to use standalone server:
# - MRI Ruby: Unicorn
# - JRuby and Rubinius: Puma
CONFIG['standalone'] = true

# Set to true to use newrelic monitoring.
# Don't forget to put your newrelic.yml in config directory.
# Default: false
CONFIG['newrelic'] = false

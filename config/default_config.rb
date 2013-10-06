CONFIG['standalone'] = true if CONFIG['standalone'].nil?
CONFIG['newrelic'] = false if CONFIG['newrelic'].nil?
CONFIG['bundler_groups'] ||= Rails.groups(:assets => %w(development test))
CONFIG['bundler_groups'] << 'standalone' if CONFIG['standalone']
CONFIG['bundler_groups'] << 'newrelic' if CONFIG['newrelic']

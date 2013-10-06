Zeropaste
=========

A pastebin with some features: create and destroy (with key) pastes.
The one running on [0paste.com](http://0paste.com).

Requirements:

* Ruby 1.9 or up (JRuby 1.7 and Rubinius 2.0 should also work)
* MySQL
  (nothing MySQL specific - can be easily changed if you know what you're doing)
* Ruby Bundler

Optional:

* Newrelic account

Suggested:

* nginx

Installation
------------

Left as an exercise.

Misc
----

Pasting from CLI:

    ...some commands... | curl 'http://0paste.com/pastes.txt' -F 'paste[paste]=<-'

Or with gzip to save bandwidth:

    ...some commands... | gzip | curl 'http://0paste.com/pastes.txt' -F 'paste[paste_gzip]=<-'

Privately:

    ...some commands... | gzip | curl 'http://0paste.com/pastes.txt' -F 'paste[is_private]=1' -F 'paste[paste_gzip]=<-'

Design
------

Current design is a bit crap. Suggestions and actual designs are welcome.

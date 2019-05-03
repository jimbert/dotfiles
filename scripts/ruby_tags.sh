
if ! [ gem list ripper-tags -i ]; then
  gem install ripper-tags >/dev/null 2>&1
fi

ripper-tags -R --exclude=.vendor

if [ gem outdated | grep ripper-tags ]; then
  gem install ripper-tags >/dev/null 2>&1
  gem cleanup
fi

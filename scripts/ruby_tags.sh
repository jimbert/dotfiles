
if ! [ -x "$(command -v ripper-tags)" ]; then
  gem install ripper-tags >/dev/null 2>&1
fi

ripper-tags -R --exclude=.vendor

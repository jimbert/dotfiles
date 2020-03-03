if [ -f "./Gemfile" ]; then
  echo 'checking ripper-tags...'
  if [ `gem list ripper-tags -i | grep false` ]; then
    echo 'Installing ripper-tags...'
    gem install ripper-tags >/dev/null 2>&1
  fi

  if [ `gem outdated | grep ripper-tags` ]; then
    echo 'Updating ripper-tags...'
    gem update ripper-tags >/dev/null 2>&1
  fi

  echo 'executing bin setup'
  if [ -f ".bin/setup" ]; then
    echo 'Running bin setup...'
    sh ./bin/setup >/dev/null 2>&1
  fi

  ripper-tags -R --exclude=.vendor
fi



Signal.trap('SIGWINCH', proc { y, x = `stty size`.split.map(&:to_i); Hirb::View.resize(x, y) if defined? Hirb } )

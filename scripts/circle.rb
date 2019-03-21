require_relative 'circle_test_time'

class Circle
  def circle_build_url
    @circle_build_url ||= `hub ci-status -v | grep circleci | grep test`.match(/https.*/)[0]
  end

  def circle_build_id
    circle_build_url.match(/\d+/)[0]
  end

  def branch_name
    `git branch-name`.strip
  end

  def repo
    ENV['PWD'].split('/').last.delete('.')
  end

  def print_slow_tests
    puts "For #{repo}, branch: #{branch_name}, build: #{circle_build_id}:"
    puts CircleTestTime.new(repo, circle_build_id).slow_tests
  end

  def print_slow_test_files
    puts "For #{repo}, branch: #{branch_name}, build: #{circle_build_id}:"
    puts CircleTestTime.new(repo, circle_build_id).slow_test_files
  end

  def print_failed_tests
    puts "For #{repo}, branch: #{branch_name}, build: #{circle_build_id}:"
    result = CircleTestTime.new(repo, circle_build_id).failed_tests

    if result.empty?
      puts 'Hooray, all your tests passed!'
    else
      puts result
      # `open #{circle_build_url}`
    end
  end
end

requests = ARGV

requests.map do |request|
  case request
  when 'build_url'
    puts Circle.new.circle_build_url
  when 'slow_tests'
    Circle.new.print_slow_tests
  when 'slow_test_files'
    Circle.new.print_slow_test_files
  when 'failed_tests'
    Circle.new.print_failed_tests
  end
end

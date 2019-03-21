require 'net/http'
require 'json'
require 'uri'

class CircleTestTime
  Stats = Struct.new(:run_times) do
    def total_run_time
      run_times.sum
    end

    def count
      run_times.count
    end

    def avg
      total_run_time / count
    end
  end

  NUMBER_OF_CONTAINERS = 16
  SLOW_TEST_TIME = 1
  PERF_RATIO_LIMIT = 0.8

  def initialize(app, build_id)
    @app = app
    @build_id = build_id
  end

  def slow_tests
    slow_tests = test_results
                 .select { |x| x['run_time'] > SLOW_TEST_TIME }
                 .sort_by { |x| x['run_time'] }
                 .reverse

    slow_tests.map do |x|
      "#{x['run_time'].round(1)}s | #{x['file']}:
        #{x['name']}"
    end
  end

  def slow_test_files
    result = test_results.each_with_object({}) do |test_result, acc|
      file_name = test_result['file']
      run_time = test_result['run_time']
      acc[file_name] ||= Stats.new([])
      acc[file_name].run_times << run_time
    end

    equal_split_time = result.sum { |_, v| v.total_run_time } / NUMBER_OF_CONTAINERS

    result
      .select { |_, v| (v.total_run_time / equal_split_time) > PERF_RATIO_LIMIT }
      .sort_by { |_, v| v.total_run_time }
      .map { |k, v| "total_run_time: #{v.total_run_time.round(2)}s(#{(v.total_run_time/60).round(2)}m) | ideal_split: #{equal_split_time.round(2)}s | ratio: #{(v.total_run_time / equal_split_time).round(2)} | average: #{v.avg.round(2)}s | #{k}" }
  end

  def failed_tests
    test_results
      .select { |x| x['result'] == 'failure'}
      .map { |x| x['file']}.uniq
  end

  private

  def test_results
    @test_results ||= fetch_test_times['tests']
    raise "No results!" unless @test_results
    @test_results
  end

  def token
    ENV['CIRCLE_CI_TOKEN']
  end

  def url
    URI.parse "https://circleci.com/api/v1.1/project/github/stitchfix/#{@app}/#{@build_id}/tests\?circle-token\=#{token}"
  end

  def fetch_test_times
    JSON.parse(Net::HTTP.get_response(url).body)
  end
end

module Matchers
  def contain(expected)
    matcher = RSpec::Matchers.define("contain #{expected.inspect}") do
      matcher do |given, matcher|
        matcher.failure_message = "expected #{given.inspect} to contain #{expected.inspect}"
        matcher.negative_failure_message = "expected #{given.inspect} not to contain #{expected.inspect}"
        given.index expected
      end
    end
    def matcher.matches?(*args, &block)
      self.call(*args, &block)
    end
  end
end

World(Matchers)

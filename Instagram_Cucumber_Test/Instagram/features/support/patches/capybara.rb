if Object.const_defined? :Capybara
  module Capybara
    module DSL
      alias :response :page
    end
  end
end
require File.dirname(__FILE__) + '/../test_helper'
require 'topics_controller'

# Re-raise errors caught by the controller.
class TopicsController; def rescue_action(e) raise e end; end

class TopicsControllerTest < ActionController::TestCase

  include KeteTestFunctionalHelper::TestHelper

  def setup
    @base_class = "Topics"
    load_test_environment
  end
end

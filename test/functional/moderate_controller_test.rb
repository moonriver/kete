require File.dirname(__FILE__) + '/../test_helper'
require 'moderate_controller'

# Re-raise errors caught by the controller.
class ModerateController; def rescue_action(e) raise e end; end

class ModerateControllerTest < ActionController::TestCase

  include KeteTestFunctionalHelper::TestHelper

  def setup
    @base_class = "Moderate"
    load_test_environment
  end
end

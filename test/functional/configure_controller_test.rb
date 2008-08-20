require File.dirname(__FILE__) + '/../test_helper'
require 'configure_controller'

# Re-raise errors caught by the controller.
class ConfigureController; def rescue_action(e) raise e end; end

class ConfigureControllerTest < ActionController::TestCase

  include KeteTestFunctionalHelper::TestHelper

  def setup
    @base_class = "Configure"
    load_test_environment
  end
end

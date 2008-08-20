require File.dirname(__FILE__) + '/../test_helper'
require 'system_settings_controller'

# Re-raise errors caught by the controller.
class SystemSettingsController; def rescue_action(e) raise e end; end

class SystemSettingsControllerTest < ActionController::TestCase

  include KeteTestFunctionalHelper::TestHelper

  def setup
    @base_class = "SystemSettings"
    load_test_environment
  end
end

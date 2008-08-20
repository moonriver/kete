require File.dirname(__FILE__) + '/../test_helper'
require 'zoom_dbs_controller'

# Re-raise errors caught by the controller.
class ZoomDbsController; def rescue_action(e) raise e end; end

class ZoomDbsControllerTest < ActionController::TestCase

  include KeteTestFunctionalHelper::TestHelper

  def setup
    @base_class = "ZoomDbs"
    load_test_environment
  end
end
require File.dirname(__FILE__) + '/../test_helper'
require 'importers_controller'

# Re-raise errors caught by the controller.
class ImportersController; def rescue_action(e) raise e end; end

class ImportersControllerTest < ActionController::TestCase

  include KeteTestFunctionalHelper::TestHelper

  def setup
    @base_class = "Importers"
    load_test_environment
  end
end

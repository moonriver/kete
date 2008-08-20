require File.dirname(__FILE__) + '/../test_helper'
require 'private_files_controller'

# Re-raise errors caught by the controller.
class PrivateFilesController; def rescue_action(e) raise e end; end

class PrivateFilesControllerTest < ActionController::TestCase

  include KeteTestFunctionalHelper::TestHelper

  def setup
    @base_class = "PrivateFiles"
    load_test_environment
  end
end

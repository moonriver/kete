require File.dirname(__FILE__) + '/../test_helper'
require 'members_controller'

# Re-raise errors caught by the controller.
class MembersController; def rescue_action(e) raise e end; end

class MembersControllerTest < ActionController::TestCase

  include KeteTestFunctionalHelper::TestHelper

  def setup
    @base_class = "Members"
    load_test_environment
  end
end

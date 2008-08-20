require File.dirname(__FILE__) + '/../test_helper'
require 'content_types_controller'

# Re-raise errors caught by the controller.
class ContentTypesController; def rescue_action(e) raise e end; end

class ContentTypesControllerTest < ActionController::TestCase

  include KeteTestFunctionalHelper::TestHelper

  def setup
    @base_class = "ContentTypes"
    load_test_environment
  end
end
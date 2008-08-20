require File.dirname(__FILE__) + '/../test_helper'
require 'index_page_controller'

# Re-raise errors caught by the controller.
class IndexPageController; def rescue_action(e) raise e end; end

class IndexPageControllerTest < ActionController::TestCase

  include KeteTestFunctionalHelper::TestHelper

  def setup
    @base_class = "IndexPage"
    load_test_environment
  end
end

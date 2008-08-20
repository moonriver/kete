require File.dirname(__FILE__) + '/../test_helper'
require 'web_links_controller'

# Re-raise errors caught by the controller.
class WebLinksController; def rescue_action(e) raise e end; end

class WebLinksControllerTest < ActionController::TestCase

  include KeteTestFunctionalHelper::TestHelper

  def setup
    @base_class = "WebLinks"
    load_test_environment
  end
end

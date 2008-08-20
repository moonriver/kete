require File.dirname(__FILE__) + '/../test_helper'
require 'video_controller'

# Re-raise errors caught by the controller.
class VideoController; def rescue_action(e) raise e end; end

class VideoControllerTest < ActionController::TestCase

  include KeteTestFunctionalHelper::TestHelper

  def setup
    @base_class = "Video"
    load_test_environment
  end
end

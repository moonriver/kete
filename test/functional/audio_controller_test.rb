require File.dirname(__FILE__) + '/../test_helper'
require 'audio_controller'

# Re-raise errors caught by the controller.
class AudioController; def rescue_action(e) raise e end; end

class AudioControllerTest < ActionController::TestCase

  include KeteTestFunctionalHelper::TestHelper

  def setup
    @base_class = "Audio"
    load_test_environment
  end
end

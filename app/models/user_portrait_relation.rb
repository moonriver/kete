class UserPortraitRelation < ActiveRecord::Base
  belongs_to :user
  belongs_to :still_image

  acts_as_list :scope => :user

  def self.new_portrait_for_user(user, still_image)
    return false unless still_image.created_by?(user)

    # return true if this image is already a portrait
    return true unless still_image.user.nil?

    # if the image is theirs and not already added, then make the relation
    user_portrait_relation = self.create(:user_id => user.id,
                                         :still_image_id => still_image.id)

    user_portrait_relation.valid?
  end

  def self.remove_portrait_for_user(user, still_image)
    return false unless still_image.created_by?(user)

    user_portrait_relation = self.find_by_user_id_and_still_image_id(user, still_image)
    user_portrait_relation.destroy
  end

  def self.make_portrait_default_for_user(user, still_image)
    return false unless still_image.created_by?(user)

    user_portrait_relation = self.find_by_user_id_and_still_image_id(user, still_image)
    user_portrait_relation.move_to_top
  end

end

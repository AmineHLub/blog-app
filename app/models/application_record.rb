class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def last_current_user
    User.first
  end
end

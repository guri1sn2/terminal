class Post < ApplicationRecord

  # map用に追記
  # geocoded_by :place_name
  # after_validation :geocode, if: :place_name_changed?

end

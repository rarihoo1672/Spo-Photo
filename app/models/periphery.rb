class Periphery < ApplicationRecord
  belongs_to :spot

  mount_uploader :sub_visual, SubVisualUploader
end

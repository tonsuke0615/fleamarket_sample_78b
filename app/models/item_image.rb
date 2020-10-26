class ItemImage < ApplicationRecord
  mount_uploader :src, ItemImagesUploader
  belongs_to :item

end

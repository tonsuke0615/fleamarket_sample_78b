class PreparationDay < ActiveHash::Base
  self.data = [
    {id: 1, status: "支払い後、1-2日で発送"}, {id: 2, status: "支払い後、2-3日で発送"}, {id: 3, status: "支払い後、4-7日で発送"}
  ]

  include ActiveHash::Associations
  has_many :items

end
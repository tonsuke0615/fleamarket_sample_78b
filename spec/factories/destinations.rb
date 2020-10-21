FactoryBot.define do

  factory :destination do
    destination_first_name              {"abe"}
    destination_family_name             {"abe"}
    destination_first_name_kana         {"アベ"}
    destination_family_name_kana        {"アベ"}
    post_code                           {"1111111"}
    prefecture                          {"東京都"}
    city                                {"トン市トントン"}
    address                             {"1−11−11"}
  end

end
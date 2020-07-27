FactoryBot.define do
  factory :user do
    nickname {'test'}
    email {'test@gmail.com'}
    password {'test1234'}
    password_confirmation {'test1234'}
    family_name {'山田'}
    first_name {'太郎'}
    family_name_kana {'ヤマダ'}
    first_name_kana {'タロウ'}
    birthday {'1995-10-04'}
  end
end
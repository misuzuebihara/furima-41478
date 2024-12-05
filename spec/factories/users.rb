FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { 'abc123' }
    password_confirmation { 'abc123' }
    name_last            { '山田' }
    name_first           { '太郎' }
    name_last_kana       { 'ヤマダ' }
    name_first_kana      { 'タロウ' }
    birthday             { '1930-01-01' }
  end
end
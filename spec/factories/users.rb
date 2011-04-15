Factory.define :user do |f|
  f.sequence(:email) { |n| "test#{n}@test.com" }
  f.password "letmein"
  f.password_confirmation { |u| u.password }
  #f.accounts { |u| [u.association(:account)]}
end
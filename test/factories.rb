Factory.define :user do |f|
  #f.sequence(:username) {|n| "foo#{n}"}
  f.password "foobar"
  f.password_confirmation {|u| u.password}
  f.sequence(:email) {|n| "foo#{n}@foo.com"}
end


Factory.define :playlist do |f|
  f.name "Foo"
  f.association :user_id , :factory => :user
end

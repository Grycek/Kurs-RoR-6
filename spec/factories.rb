Factory.define :user do |f|
  f.squence(:username) {|n| "foo#{n}"}
  f.password "foobar"
  f.password_confirmation {|u| u.password}
  f.squence(:email) {|n| "foo#{n}@foo.com"}
end

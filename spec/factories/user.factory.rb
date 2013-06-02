FactoryGirl.define do
  factory :user do
    email { "peranito@shakirita.com" }
    password_hash { "$2a$10$QVlubPhIkpQGvLzvnkqGC.igPkhGj3WiTUESQtMMI3UG7MGMlyQ4W" }
    password_salt { "$2a$10$QVlubPhIkpQGvLzvnkqGC." }
  end
end
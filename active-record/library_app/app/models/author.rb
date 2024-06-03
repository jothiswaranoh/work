# app/models/author.rb
class Author < ApplicationRecord
  has_many :books
end
# app/models/supplier.rb
class Supplier < ApplicationRecord
  has_one :account
end

# app/models/account.rb
class Account < ApplicationRecord
  belongs_to :supplier
  has_one :account_history
end

# app/models/account_history.rb
class AccountHistory < ApplicationRecord
  belongs_to :account
end

# app/models/physician.rb
class Physician < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
end

# app/models/appointment.rb
class Appointment < ApplicationRecord
  belongs_to :physician
  belongs_to :patient
end

# app/models/patient.rb
class Patient < ApplicationRecord
  has_many :appointments
  has_many :physicians, through: :appointments
end

# app/models/assembly.rb
class Assembly < ApplicationRecord
  has_and_belongs_to_many :parts
end

# app/models/part.rb
class Part < ApplicationRecord
  has_and_belongs_to_many :assemblies
end

# app/models/picture.rb
class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true
end

# app/models/employee.rb
class Employee < ApplicationRecord
  has_many :pictures, as: :imageable
end

# app/models/product.rb
class Product < ApplicationRecord
  has_many :pictures, as: :imageable
end

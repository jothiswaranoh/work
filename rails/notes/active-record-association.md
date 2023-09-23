
```markdown
# Understanding Active Record Associations in Ruby on Rails

In Ruby on Rails, associating models is essential for building web applications. This post provides a quick overview of Active Record Associations within the Ruby on Rails framework.

## `belongs_to`

```ruby
# app/models/book.rb
class Book < ApplicationRecord
  belongs_to :author

  # Establishes a 1:1 connection with another model (Author in this case)
  # Books are associated with authors via the `author_id` column in the books table
end
```

## `has_many`

```ruby
# app/models/author.rb
class Author < ApplicationRecord
  has_many :books

  # Naming is plural and indicates a one-to-many association.
  # An author can have many books in this example, associated via `author_id`.
end
```

## `has_one`

```ruby
# app/models/supplier.rb
class Supplier < ApplicationRecord
  has_one :account

  # Represents a one-to-one association.
  # Supplier will only ever have a single account in this example, associated via `supplier_id`.
end
```

## `has_many through`

```ruby
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
```

## `has_one through`

```ruby
# app/models/supplier.rb
class Supplier < ApplicationRecord
  has_one :account
  has_one :account_history, through: :account
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
```

## `has_and_belongs_to_many` (HABTM)

```ruby
# app/models/assembly.rb
class Assembly < ApplicationRecord
  has_and_belongs_to_many :parts
end

# app/models/part.rb
class Part < ApplicationRecord
  has_and_belongs_to_many :assemblies
end
```

## Polymorphic Associations

Polymorphic associations allow a model to belong to more than one other model on a single association.

```ruby
# app/models/picture.rb
# The `pictures` table has both `imageable_id` and `imageable_type` columns.
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
```


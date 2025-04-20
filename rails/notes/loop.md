### 🔁 Loop / Enumerable Methods

# each
[1, 2, 3].each { |n| puts n }

# each_with_index
['a', 'b'].each_with_index { |val, i| puts "#{i}: #{val}" }

# each_with_object
[1, 2].each_with_object([]) { |i, arr| arr << i * 2 }

# each_index
['a', 'b'].each_index { |i| puts i }

# each_key
{a: 1, b: 2}.each_key { |key| puts key }

# each_value
{a: 1, b: 2}.each_value { |val| puts val }

# each_pair
{a: 1, b: 2}.each_pair { |k, v| puts "#{k}: #{v}" }


### 🔄 Transformation

# map
[1, 2].map { |n| n * 2 }

# collect (alias of map)
[1, 2].collect { |n| n * 3 }

# flat_map
[[1,2],[3]].flat_map { |arr| arr }

# map!
arr = [1, 2]; arr.map! { |n| n * 2 }

# collect!
arr = [2, 4]; arr.collect! { |n| n + 1 }

# compact_map (Ruby 3.1+)
[1, nil, 2].compact_map { |x| x&.*(2) }  #=> [2, 4]


### 🔍 Filtering

# select
[1, 2, 3].select(&:even?)

# reject
[1, 2, 3].reject(&:even?)

# filter (same as select)
[1, 2, 3].filter(&:odd?)

# filter_map
[1, 2, 3].filter_map { |x| x * 2 if x.odd? }  #=> [2, 6]

# grep
["foo", "bar", "baz"].grep(/ba/)

# grep_v (exclude)
["foo", "bar"].grep_v(/ba/)

# find_all (alias of select)
[1,2,3].find_all(&:odd?)


### 🔎 Searching

# find
[1, 2, 3].find { |x| x > 1 }

# detect (alias of find)
[1, 2, 3].detect { |x| x == 2 }

# find_index
["a", "b"].find_index("b")

# rindex
[1,2,3,2].rindex(2)


### ✅ Predicate Methods

# any?
[1, 2, 3].any?(&:even?)

# all?
[2, 4, 6].all?(&:even?)

# none?
[1, 3, 5].none?(&:even?)

# one?
[1, 2, 3].one?(&:even?)

# include?
["a", "b"].include?("a")

# member?
[1, 2, 3].member?(2)


### 🔢 Index / Counting

# count
[1, 2, 2, 3].count(2)

# index
["a", "b"].index("b")

# rindex
[1,2,3,2].rindex(2)


### 🧮 Reduction / Aggregation

# reduce
[1, 2, 3].reduce(:+)

# inject (same as reduce)
[1, 2, 3].inject(:*)

# sum
[1, 2, 3].sum

# max
[3, 1, 2].max

# min
[3, 1, 2].min

# max_by
[1, 2, 3].max_by { |x| -x }

# min_by
[1, 2, 3].min_by(&:abs)

# minmax
[3, 1, 2].minmax

# minmax_by
%w[apple pear fig].minmax_by(&:length)


### 🔃 Grouping / Chunking

# group_by
[1, 2, 3, 4].group_by { |x| x.even? }

# chunk
[1, 2, 2, 3].chunk { |x| x }.to_a

# slice_when
[1, 2, 3, 1].slice_when { |a, b| a > b }.to_a

# chunk_while
[1,2,3,6,9].chunk_while { |a,b| b - a == 3 }.to_a

# each_slice
(1..6).each_slice(2).to_a

# each_cons
(1..4).each_cons(2).to_a


### 🔄 Sorting

# sort
[3, 1, 2].sort

# sort_by
%w[apple dog banana].sort_by(&:length)

# reverse_each
[1, 2, 3].reverse_each { |x| puts x }


### 🧪 Boolean Utilities

# cycle
[1,2].cycle(2) { |x| puts x }

# zip
[1, 2].zip(["a", "b"])

# partition
[1, 2, 3].partition(&:even?)

# uniq
[1,2,2,3].uniq

# uniq_by (Rails/ActiveSupport)
User.all.uniq_by(&:email)

# tally
["a", "b", "a"].tally

# lazy
(1..Float::INFINITY).lazy.select(&:even?).first(5)

# zip: combines elements from multiple arrays
[1, 2].zip(["a", "b"])                #=> [[1, "a"], [2, "b"]]

# product: returns all combinations of elements
[1, 2].product([3, 4])                #=> [[1, 3], [1, 4], [2, 3], [2, 4]]

# concat: appends elements to an array (modifies receiver)
[1, 2].concat([3, 4])                 #=> [1, 2, 3, 4]

### ✅ Rails Predicate Helpers (ActiveSupport)

# present?
"hello".present?  #=> true

# blank?
"".blank?         #=> true

# empty?
[].empty?          #=> true

# any?
[1, 2].any?        #=> true

# none?
[].none?           #=> true

# one?
[1].one?           #=> true

# many?
[1, 2].many?       #=> true (Rails only)

# exists?
User.exists?(1)    #=> true if user with ID 1 exists

# persisted?
user.persisted?    #=> true if user is saved in DB

# new_record?
user.new_record?   #=> true if not saved yet

# destroyed?
user.destroyed?    #=> true if user was destroyed

# changed?
user.changed?      #=> true if any attribute changed

# changed_attributes?
user.changed_attributes.any?  #=> true if any attribute tracked as changed

# valid?
user.valid?        #=> true if model is valid

# invalid?
user.invalid?      #=> true if not valid

# errors.any?
user.errors.any?   #=> true if validation errors exist

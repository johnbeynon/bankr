Factory.define :transaction do |f|
  f.amount 0
  f.statement_date '2011-04-16'
  f.association :account
end
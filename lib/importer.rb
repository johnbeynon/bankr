module Importer
  
  def ofx(statement)
        
    OFX(statement).account.transactions.each do |transaction|
      t = Transaction.new
      t.statement_date = transaction.posted_at
      t.vendor = transaction.name
      t.amount = transaction.amount
      t.save   
    end    
  end
  
  def csv(statement)
    require 'csv'
    
    if CSV.const_defined? :Reader
      csv = FasterCSV
    else
      csv = CSV
    end
    
    csv.foreach(statement, :headers => false) do |row|
      unless row[0].blank?
        t = Transaction.new(
                        :statement_date         => row[0], 
                        :vendor                => row[1],
                        :amount               => row[2]
                        ) 
        t.save!     
        puts "CREATED: #{row}"
      else
        puts "SKIPPING row with empty first column: #{row.inspect}"
      end
    end
    
  end
    
end
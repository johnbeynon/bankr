namespace :import do
  
  desc "Import CSV bank statement"
  task :csv, :filename, :account_id, :needs => :environment do |t, args|
    puts "Importing CSV bank statement"
    include Importer
    
    statement = File.open(args.filename)
    
    csv(statement, args.account_id)
    puts "CSV Import Completed"    
    
  end
  
  desc "Import OFX statement"
  task :ofx, :filename, :account_id, :needs => :environment do |t,args|
    puts "Importing OFX bank statement"
    include Importer
    
    # Open the the requested file
    statement = File.open(args.filename)    
    # Run the OFX import against the passed in statement
    ofx(statement, args.account_id)
    puts "OFX Import Completed"    
    
  end
  
end
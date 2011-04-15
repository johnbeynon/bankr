namespace :import do
  
  desc "Import CSV bank statement"
  task :csv, :filename, :needs => :environment do |t, args|
    puts "Importing CSV bank statement"
    include Importer
    
    statement = File.open(args.filename)
    
    csv(statement)
    puts "CSV Import Completed"    
    
  end
  
  desc "Import OFX statement"
  task :ofx, :filename, :needs => :environment do |t,args|
    puts "Importing OFX bank statement"
    include Importer
    
    # Open the the requested file
    statement = File.open(args.filename)    
    # Run the OFX import against the passed in statement
    ofx(statement)
    puts "OFX Import Completed"    
    
  end
  
end
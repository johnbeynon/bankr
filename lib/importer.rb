module Importer

	def ofx(statement,account_id)

		OFX(statement).account.transactions.each do |transaction|
			t = Transaction.new
			t.account_id = account_id
			t.posted_at = transaction.posted_at
			t.name = transaction.name
			t.amount = transaction.amount
			t.fitid = transaction.fit_id
			t.save!
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
												:posted_at				 => row[0],
												:name								 => row[1],
												:amount								=> row[2]
												)
				t.save!
				puts "CREATED: #{row}"
			else
				puts "SKIPPING row with empty first column: #{row.inspect}"
			end
		end

	end

end
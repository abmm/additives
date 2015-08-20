require 'csv'
namespace :initial_import do

	CLASSIFICATIONS = ["Colorante","Conservante","Antioxidante","Estabilizante","Edulcorante"]

  ORIGINS = ["Natural","Natural (vegetal)","Natural (animal)","Seminatural",
	"Natural (animal) o Artificial","Natural o Artificial","Artificial"]

  #NOTE: ONLY IMPORT ONCE!!!
  #TODO: CHECK IF THE INITIAL IMPORT HAVE BEEN ALREADY DONE
  desc "Initial Import of Classifications"
  	task classifications: :environment do
  	CLASSIFICATIONS.each_with_index do |value, index|
  		c = Classification.create({classification_id: index, name: value})
  		puts "Added classification #{value}:#{index}" if c.id
  	end
  end

  desc "Initial Import of Origins"
  task origins: :environment do
  	ORIGINS.each_with_index do |value, index|
  		o = Origin.create({origin_id: index, name: value})
  		puts "Added origin #{value}:#{index}" if o.id
  	end
  end


  #"Code";"Name";"Classificacicion";"Origin";"Description";"Use";"Effects";"Toxicity"
  desc "Initial Import of Additives"
  task additives: :environment do
  	HEADER = [:code, :name, :classification_id, :origin_id, :description, :use,
  	 :effects, :toxicity]
		CSV.foreach("#{Dir.pwd}/lib/tasks/additives.csv",{:col_sep => ";"}) do |row|
			additive = Additive.new
			HEADER.each_with_index do |field, index|
				additive.send("#{field}=", row[index])
			end
			puts "Added additive #{additive.code}:#{additive.name}" if additive.save
		end
  end

end



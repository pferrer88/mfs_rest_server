# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#helpers

def rand_time(from, to=Time.now)
  Time.at(rand_in_range(from.to_f, to.to_f))
end

def rand_in_range(from, to)
  rand * (to - from) + from
end


Driver.delete_all
JSON.parse(open("#{Rails.root}/db/drivers.json").read).each do |data|
   Driver.create(data)
end
puts "Drivers: " << Driver.count.to_s


Customer.delete_all
Contact.delete_all
Location.delete_all
JSON.parse(open("#{Rails.root}/db/locations.json").read).each do |data|
  customer = Customer.create :name => data["customerName"], :code => data["customerCode"], :groupCode => data["customerGroupCode"]
  location = customer.locations.build 
  location.name = data["name"]
  location.code = data["code"]
  location.address1 = data["address1"]
  location.address2 = data["address2"]
  location.city = data["city"]
  location.state = data["state"]
  location.postalCode = data["postalCode"]
  location.isActive = data["isActive"]
  location.save
  location.contacts.create :name => data["contactName"], :phone => data["contactPhone"], :email => data["contactEmail"], :title => data["contactTitle"]
end
puts "Locations: " << Location.count.to_s
puts "Contacts: " << Contact.count.to_s
puts "Customers: " << Customer.count.to_s


Service.delete_all
Component.delete_all
JSON.parse(open("#{Rails.root}/db/services.json").read).each do |data|
   service = Service.new
   service.name = data["name"]
   service.code = data["code"]
   service.shortName = data["shortName"]
   service.description = data["description"]
   service.isActive = data["isActive"]
   service.save
   
   data["components"].each do |compData|
     service.components.create :name => compData["name"],
       :code => compData["code"],
       :shortName => compData["shortName"],
       :description => compData["description"],
       :isActive => compData["isActive"],
       :uomCode => compData["uoms"][0]["uomCode"],
       :uomUnit => compData["uoms"][0]["uomUnit"]
   end
end
puts "Services: " << Service.count.to_s 
puts "Components: " << Component.count.to_s 

Contract.delete_all
ContractService.delete_all
ContractComponent.delete_all
JSON.parse(open("#{Rails.root}/db/contracts.json").read).each do |data|
   contract = Contract.new
   contract.customer = Customer.find_by_code(data["customerCode"])
   if contract.customer
     contract.location = contract.customer.locations.find_by_code(data["locationCode"])
     contract.earliestCurrentServiceDate = data["earliestCurrentServiceDate"]
     contract.save

     data["services"].each do |data2|
       cs = contract.contract_services.build :earliestCurrentServiceDate => data2["currentServiceDate"]
       cs.service = Service.find_by_code(data2["serviceCode"])
       cs.driver = Driver.first
       cs.save
     
       data2["components"].each do |data3|
         cc = cs.contract_components.build :price => data3["price"], :chargeCode => data3[":chargeCode"]
         cc.component = Component.find_by_code(data3["componentCode"])
         puts "Component Not Fount" unless cc.component
         cc.save
       end
     
     end
   else
     puts "Customer NOT Found: " << data["customerCode"].to_s
   end
end
puts "Contracts: " << Contract.count.to_s 
puts "ContractService: " << ContractService.count.to_s 
puts "ContractComponents: " << ContractComponent.count.to_s 


Route.delete_all

20.times do |i|
  route = Route.new
  route.driver = Driver.first
  route.name  = Faker::Address.city #Faker::Name.name
  route.startDT = rand_time(20.days.ago)
  route.isComplete = false
  route.save
  10.times do |i|
    stop = route.stops.build :isComplete => false
    stop.contract = Contract.all[i]
    stop.save
  end
end

puts "Routes: " << Route.count.to_s





# Component.delete_all
# JSON.parse(open("#{Rails.root}/db/components.json").read).each do |data|
#    Component.create(data)
# end
# puts Component.count

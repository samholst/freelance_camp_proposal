# rails g scaffold Proposal customer: string portfolio_url:sring tools:string estimated_hours:decimal hourly_rate:decimal weeks_to_complete:integer client_email:string

10.times do |proposal|
  Proposal.create!(customer: "Customer: #{proposal}",
                   portfolio_url: "https://www.samwholst.com",
                   tools: "Ruby on Rails, Angular 4, and Postgres",
                   estimated_hours: (80 + proposal),
                   hourly_rate: (120 + proposal),
                   weeks_to_complete: (12 + proposal),
                   client_email: "sawohol@gmail.com"
                   )
end

puts "10 proposals created"

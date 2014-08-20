User.create username: 'JoshAshby', email: 'joshuaashby@joshashby.com', password: ENV["SUPER_SECRET_PASSWORD"]

types = [
  "Blade",
  "Soap",
  "Razor",
  "Alum Block",
  "Brush"
]

types.each do |name|
  Shaving::Type.create name: name
end

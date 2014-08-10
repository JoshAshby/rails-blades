types = [
  "Blade",
  "Soap",
  "Razor",
  "Alum Block",
  "Brush"
]

types.each do |name|
  Shaving::Type.create :name => name
end

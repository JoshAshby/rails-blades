user = User.find_by email: 'joshuaashby@joshashby.com'

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

brands = [
  'Super Max',
  'Lord',
  'Gillette',
  'Derby',
  'Blue Bird',
  'Proraso'
]

brands.each do |name|
  Shaving::Brand.create name: name, user_id: 1
end

products = [
  {
    name: 'Super Max - Platinum',
    brand: 'Super Max',
    type: 'Blade'
  },
  {
    name: 'Lord Platinum',
    brand: 'Lord',
    type: 'Blade'
  },
  {
    name: 'Gillette Silver Blue',
    brand: 'Gillette',
    type: 'Blade'
  },
  {
    name: 'Derby Extra',
    brand: 'Derby',
    type: 'Blade'
  },
  {
    name: 'Blue Bird HI-Stainless',
    brand: 'Blue Bird',
    type: 'Blade'
  },
  {
    name: 'Proraso Sapone',
    brand: 'Proraso',
    type: 'Soap'
  }
]

products.each do |product|
  type = Shaving::Type.find_by name: product[:type]
  brand = Shaving::Brand.find_by name: product[:brand]

  Shaving::Product.create name: product[:name], brand: brand, type: type, user: user
end

reviews = [
  {
    reviewed_on: "7/10/2014",
    product: "Super Max - Platinum",
    shaving_feel: 8,
    face_feel: 8,
    overall_rating: 8,
    comments: "First time actually shaving. Few nicks (inexperience)"
  },
  {
    reviewed_on: "7/12/2014",
    product: "Super Max - Platinum",
    shaving_feel: 8,
    face_feel: 9,
    overall_rating: 8,
    comments: "Second time, managed to cut my neck up a fair deal on the right side near the middle. few nicks again"
  },
  {
    reviewed_on: "7/13/2014",
    product: "Super Max - Platinum",
    shaving_feel: 8,
    face_feel: 9,
    overall_rating: 8
  },
  {
    reviewed_on: "7/15/2014",
    product: "Lord Platinum",
    shaving_feel: 6,
    face_feel: 6,
    overall_rating: 4,
    comments: "Missed quiet a few places it seems, even after I went through and made sure I touched up. Blade felt slightly rough and mildly pullish. Also got some nice razor burn with it.  Razor burn"
  },
  {
    reviewed_on: "7/16/2014",
    product: "Lord Platinum",
    shaving_feel: 6,
    face_feel: 7,
    overall_rating: 5,
    comments: "Razor burn again"
  },
  {
    reviewed_on: "7/18/2014",
    product: "Gillette Silver Blue",
    shaving_feel: 9,
    face_feel: 9,
    overall_rating: 9,
    comments: "Nicest blade I've used so far. No razor burn or anything, not even tugging. It just cut cleanly and smoothly."
  },
  {
    reviewed_on: "7/20/2014",
    product: "Gillette Silver Blue",
    shaving_feel: 9,
    face_feel: 9,
    overall_rating: 9,
    comments: "Still a very nice blade to use, was super smooth and easy on the skin but gave a good shave."
  },
  {
    reviewed_on: "7/21/2014",
    product: "Gillette Silver Blue",
    shaving_feel: 9,
    face_feel: 9,
    overall_rating: 9
  },
  {
    reviewed_on: "7/23/2014",
    product: "Derby Extra",
    shaving_feel: 6,
    face_feel: 8,
    overall_rating: 8,
    comments: "Felt a little pullish, didn't feel like a nice shave but it turned out pretty good. Didn't get real close on the neck area though"
  },
  {
    reviewed_on: "7/27/2014",
    product: "Derby Extra",
    shaving_feel: 6,
    face_feel: 8,
    overall_rating: 8
  },
  {
    reviewed_on: "8/2/2014",
    product: "Derby Extra",
    shaving_feel: 8,
    face_feel: 8,
    overall_rating: 8,
    comments: "Didn't shave for a week and this blade did a fairly okay job at working through all that. Did have a slight pull to it even after getting it cut down."
  },
  {
    reviewed_on: "8/5/2014",
    product: "Blue Bird HI-Stainless",
    shaving_feel: 7,
    face_feel: 7,
    overall_rating: 7,
    comments: "Few cuts"
  },
  {
    reviewed_on: "7/10/2014",
    product: "Proraso Sapone",
    overall_rating: 8,
    face_feel:      7,
    shaving_feel:   8,
    comments: "Slightly dry face, maybe as a result of soap. Tingly"
  },
  {
    reviewed_on: "7/12/2014",
    product: "Proraso Sapone",
    overall_rating: 8,
    face_feel:      8,
    shaving_feel:   8,
    comments: "Slightly dry face, but not sure if thats from the soap or the alum block or both or what. Finding its better to make the lather right in the soap bowl rather than the mug because of how hard the soap is. Reading online seems to agree for this soap."
  },
  {
    reviewed_on: "7/13/2014",
    product: "Proraso Sapone",
    overall_rating: 8,
    face_feel:      8,
    shaving_feel:   8,
    comments: "Had some dry skin this morning, not sure if from soap or not. Probably not since I didn't shave last night."
  },
  {
    reviewed_on: "7/15/2014",
    product: "Proraso Sapone",
    overall_rating: 8,
    face_feel:      8,
    shaving_feel:   8
  },
  {
    reviewed_on: "7/16/2014",
    product: "Proraso Sapone",
    overall_rating: 8,
    face_feel:      8,
    shaving_feel:   8
  },
  {
    reviewed_on: "7/18/2014",
    product: "Proraso Sapone",
    overall_rating: 8,
    face_feel:      8,
    shaving_feel:   8
  },
  {
    reviewed_on: "7/20/2014",
    product: "Proraso Sapone",
    overall_rating: 8,
    face_feel:      8,
    shaving_feel:   8
  },
  {
    reviewed_on: "7/21/2014",
    product: "Proraso Sapone",
    overall_rating: 8,
    face_feel:      8,
    shaving_feel:   8
  },
  {
    reviewed_on: "7/23/2014",
    product: "Proraso Sapone",
    overall_rating: 8,
    face_feel:      8,
    shaving_feel:   8
  },
  {
    reviewed_on: "7/27/2014",
    product: "Proraso Sapone",
    overall_rating: 8,
    face_feel:      8,
    shaving_feel:   8
  },
  {
    reviewed_on: "8/2/2014",
    product: "Proraso Sapone",
    overall_rating: 8,
    face_feel:      8,
    shaving_feel:   8
  },
  {
    reviewed_on: "8/5/2014",
    product: "Proraso Sapone",
    overall_rating: 8,
    face_feel:      8,
    shaving_feel:   8
  }
]

reviews.each do |review|
  review[:product] = Shaving::Product.find_by name: review.delete(:product)
  review[:user] = user

  review[:reviewed_on] = Date.strptime review[:reviewed_on], "%m/%d/%Y"


  if review[:comments].nil?
    review[:comments] = ""
    puts "Nil"
  else
    puts "Not Nil"
  end

  review = Shaving::Review.create review
end

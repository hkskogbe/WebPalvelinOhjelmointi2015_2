b1 = Brewery.create name:"Koff", year:1897
b2 = Brewery.create name:"Malmgard", year:2001
b3 = Brewery.create name:"Weihenstephaner", year:1042

Style.create name:"Lager", description:"TBA"
Style.create name:"Pale Ale", description:"TBA"
Style.create name:"Oma keitos", description:"TBA"

b1.beers.create name:"Iso 3", style_id: 1
b1.beers.create name:"Karhu", style_id: 1
b1.beers.create name:"Tuplahumala", style_id: 1
b2.beers.create name:"Huvila Pale Ale", style_id: 2
b2.beers.create name:"X Porter", style_id: 2
b3.beers.create name:"Hefezeizen", style_id: 3
b3.beers.create name:"Helles", style_id: 1

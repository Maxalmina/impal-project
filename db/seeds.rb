users = User.create([
  {
    username: "customer",
    email: "customer@customer.com",
    password: "customerpassword",
    password_confirmation: "customerpassword",
    alamat: "Bandung",
    telp: "0221234567"
  },{
    username: "customer2",
    email: "customer2@customer.com",
    password: "customer2password",
    password_confirmation: "customer2password",
    alamat: "Jakarta",
    telp: "0227654321"
  },{
    username: "customer3",
    email: "customer3@customer.com",
    password: "customer3password",
    password_confirmation: "customer3password",
    alamat: "Surabaya",
    telp: "0221234321"
  },{
    username: "admin",
    email: "admin@admin.com",
    password: "adminpassword",
    password_confirmation: "adminpassword",
    alamat: "Bali",
    telp: "123456789"
  },
  
])

produsens = Produsen.create([
  {
    name: "IKEA",
    description: "IKEA furniture and home accessories are practical, well designed and affordable"
  },{
    name: "Ace Hardware",
    description: "American hardware retailers' cooperative based in Oak Brook, Illinois, United States"
  },{
    name: "Amazon",
    description: "American electronic commerce and cloud computing company"
  },{
    name: "The Home Depot",
    description: "all your home improvement needs: appliances, etc."
  }
])

furnitures = Furniture.create([
  {
    name: "white green pillow",
    price: 15,
    description: "pillow for living room",
    produsen: produsens[1],
    image: "https://images.pexels.com/photos/1248583/pexels-photo-1248583.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
  },{
    name: "red chair",
    price: 45,
    description: "a chair",
    produsen: produsens[1],
    image: "https://images.pexels.com/photos/327507/pexels-photo-327507.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
  },{
    name: "smile sign",
    price: 32,
    description: "decoration for a room",
    produsen: produsens[0],
    image: "https://images.pexels.com/photos/967016/pexels-photo-967016.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
  },{
    name: "office desk",
    price: 103,
    description: "a desk for children",
    produsen: produsens[1],
    image: "https://images.pexels.com/photos/115747/pexels-photo-115747.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
  },{
    name: "modern bed",
    price: 250,
    description: "a bed for your comfort",
    produsen: produsens[0],
    image: "https://images.pexels.com/photos/775219/pexels-photo-775219.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
  },{
    name: "bookcase",
    price: 78,
    description: "looks beautiful",
    produsen: produsens[0],
    image: "https://images.pexels.com/photos/271816/pexels-photo-271816.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
  },{
    name: "blue sofa",
    price: 94,
    description: "sofa for your living room",
    produsen: produsens[0],
    image: "https://images.pexels.com/photos/1282315/pexels-photo-1282315.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
  },{
    name: "black wooden shelf",
    price: 101,
    description: "looks beautiful",
    produsen: produsens[1],
    image: "https://images.pexels.com/photos/683929/pexels-photo-683929.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
  },{
    name: "white green pillow",
    price: 15,
    description: "pillow for living room",
    produsen: produsens[2],
    image: "https://images.pexels.com/photos/1248583/pexels-photo-1248583.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
  },{
    name: "red chair",
    price: 45,
    description: "a chair",
    produsen: produsens[2],
    image: "https://images.pexels.com/photos/327507/pexels-photo-327507.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
  },{
    name: "smile sign",
    price: 32,
    description: "decoration for a room",
    produsen: produsens[3],
    image: "https://images.pexels.com/photos/967016/pexels-photo-967016.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
  },{
    name: "office desk",
    price: 103,
    description: "a desk for children",
    produsen: produsens[2],
    image: "https://images.pexels.com/photos/115747/pexels-photo-115747.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
  },{
    name: "modern bed",
    price: 250,
    description: "a bed for your comfort",
    produsen: produsens[3],
    image: "https://images.pexels.com/photos/775219/pexels-photo-775219.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
  },{
    name: "bookcase",
    price: 78,
    description: "looks beautiful",
    produsen: produsens[3],
    image: "https://images.pexels.com/photos/271816/pexels-photo-271816.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
  },{
    name: "blue sofa",
    price: 94,
    description: "sofa for your living room",
    produsen: produsens[3],
    image: "https://images.pexels.com/photos/1282315/pexels-photo-1282315.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
  },{
    name: "black wooden shelf",
    price: 101,
    description: "looks beautiful",
    produsen: produsens[2],
    image: "https://images.pexels.com/photos/683929/pexels-photo-683929.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
  },
])

transaksis = Transaksi.create([
  {
    user: users[0],
    produsen: Produsen.all[1],
    status: 0
  },{
    user: users[0],
    produsen: Produsen.all[2],
    status: 1
  },{
    user: users[0],
    produsen: Produsen.all[0],
    status: 2
  },{
    user: users[0],
    produsen: Produsen.all[3],
    status: 3
  },
])

transaction_details = TransactionDetail.create([
  {
    transaksi: transaksis[0],
    furniture: Produsen.all[0].furnitures[rand(1..3)],
    quantity: 1
  },{
    transaksi: transaksis[1],
    furniture: Produsen.all[1].furnitures[rand(1..3)],
    quantity: 2
  },{
    transaksi: transaksis[2],
    furniture: Produsen.all[2].furnitures[rand(1..3)],
    quantity: 3
  },{
    transaksi: transaksis[3],
    furniture: Produsen.all[3].furnitures[rand(1..3)],
    quantity: 2
  }
])
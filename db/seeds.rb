users = User.create([
    {
      username: "customer",
      email: "customer@customer.com",
      password: "customerpassword",
      password_confirmation: "customerpassword",
      alamat: "Bandung",
      telp: "0221234567",
      role: "customer"
    },
    {
      username: "produsen",
      email: "produsen@produsen.com",
      password: "produsenpassword",
      password_confirmation: "produsenpassword",
      alamat: "Cimahi",
      telp: "0227654321",
      role: "produsen"
    },
  ])
# Rellet


To use the Rellet API Sandbox:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`
  * Assuming you have `httpie` installed on your machine, run the following command to get a token: `$ http http://localhost/token`
  * Now you can visit one of the following endpoints with `$ http http://localhost:4000/<endpoint> --auth <your-token>`:
    * `/accounts`
    * `/accounts/:account_id`
    * `/accounts/:account_id/details`
    * `/accounts/:account_id/balances`
    * `/accounts/:account_id/transactions`
    * `/accounts/:account_id/transactions/:transaction_id`



## Stuff that helped me
+ https://stackoverflow.com/questions/8538611/procedurally-generating-a-massive-universe
+ https://stackoverflow.com/questions/52517394/how-to-generate-a-key-for-a-procedurally-generated-map-using-diamond-square-algo
+ https://stackoverflow.com/questions/69505500/does-elixir-erlang-random-rand-seed-need-to-be-called-on-each-process
+ https://hashrocket.com/blog/posts/the-adventures-of-generating-random-numbers-in-erlang-and-elixir
+ https://urgetopunt.com/2019/03/05/generating-random-strings-in-ruby-python-and-elixir.html
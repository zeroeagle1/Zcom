defmodule ZcomInfra.EndpointsTests do
  use ExUnit.Case
  use Plug.Test

  doctest ZcomInfra.Endpoints

  alias ZcomInfra.Endpoints

  @opts Endpoints.init([])

  test "returns 200" do
    conn =
    conn(:get, "/directions?origin=Victoriaville&destination=warwick", "")
    |> Endpoints.call(@opts)

    assert conn.state == :sent
    assert conn.status == 200
  end


  test "returns 400" do
    conn =
    conn(:get, "/directions?destination=warwick", "")
    |> Endpoints.call(@opts)
    #params destination and origin are required in query string
    assert conn.state == :sent
    assert conn.status == 400
    assert conn.resp_body == "Some params are missing, params needed: from, to, methode"
  end

  test "returns 404" do
    conn =
    conn(:get, "/NotFound", "")
    |> Endpoints.call(@opts)

    assert conn.state == :sent
    assert conn.status == 404
    assert conn.resp_body == "Not found!"
  end
end

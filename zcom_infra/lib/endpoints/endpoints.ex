defmodule ZcomInfra.Endpoints do
  use Plug.Router
  use Plug.ErrorHandler

  import Logger

  plug(Plug.Parsers, parsers: [:urlencoded, :multipart])

  plug(:match)
  plug(:dispatch)

  get "/directions" do
    if validate_query_string?(conn) do
    %{status: status, body: body} = call_googlemap_api(conn.params)

    #%{geocoded_waypoints: _, routes: _, status: status}
    #abc = JSON.decode!(body)
    #Logger.info(abc["geocoded_waypoints"])

    send_resp(conn, status, body)
    else
      send_resp(conn, 400, "Some params are missing, params needed: from, to, methode")
    end
  end

  match(_, do: send_resp(conn, 404, "Not found!"))

  defp validate_query_string?(conn) do
    conn = fetch_query_params(conn)

    if(Map.has_key?(conn.params, "origin") and Map.has_key?(conn.params, "destination")) do
      true
    else
      false
    end
  end

  defp read_google_key_file(path) do
    File.read!(path)
  end

  defp call_googlemap_api(query_string) do

    #TODO::place this in config.
    key = read_google_key_file("googleKey.txt")
    googlemap_url = "https://maps.googleapis.com/maps/api/directions/json?key=#{key}"

    case HTTPoison.get(googlemap_url, [], params: query_string) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        %{status: 200, body: body}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        %{status: 404, body: "Not found"}

      {:error, %HTTPoison.Error{reason: reason}} ->
        %{status: 400, body: reason}

      _ ->
        %{status: 400, body: "Bad request"}
      end


  end
end

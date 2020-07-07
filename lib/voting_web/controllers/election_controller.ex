defmodule VotingWeb.ElectionController do
  use VotingWeb, :controller

  alias Voting.CreateElection

  def create(conn, params) do
    case CreateElection.run(params) do
      {:ok, election} ->
        conn
        |> put_status(201)
        |> render(conn, "election.json", %{election: election})
      
      {:error, _} ->
        conn
        |> put_status(422)
        |> json(%{status: "unprocesable entity"})
    end
  end
end
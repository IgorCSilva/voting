defmodule VotingWeb.Admin.SessionViewTest do
  use ExUnit.Case, async: true

  import Voting.Factory

  alias VotingWeb.Admin.SessionView

  test "render/2 returns ok and the admin data" do
    admin = params_for(:admin, name: "John Smith") # Referente ao Voting.Factory.

    assert %{status: "ok", data: %{name: "John Smith", token: "foo"}} = SessionView.render("session.json", %{admin: admin, token: "foo"})
  end
end
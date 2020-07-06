defmodule Voting.AdminRepo do
@moduledoc """
Admin Repository
"""

  alias Voting.{Admin, Repo}

  def get_admin!(id) do
    Repo.get!(Admin, id)
  end

end
defmodule Voting.SignInAdminTest do
  use Voting.DataCase, async: true

  import Voting.Factory

  alias Voting.{Admin, SignInAdmin}

  describe "run/2" do
    setup do
      insert(:admin) # Relacionado ao factory.
      :ok

    end
    test "return ok when email and password match" do
      assert {:ok, %Admin{}} = SignInAdmin.run("email@example.com", "123456")
    end

    test "returns error when there is no admin with this email" do
      assert {:error, :email_or_password_invalid} = SignInAdmin.run("wrong@example.com", "123456")
    end

    test "returns error when the password is invalid" do
      assert {:error, :email_or_password_invalid} = SignInAdmin.run("email@example.com", "asdf")
    end
  end
end
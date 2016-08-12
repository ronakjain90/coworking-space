defmodule CoworkingSpace.RegistrationControllerTest do
  use CoworkingSpace.ConnCase

  alias CoworkingSpace.User

  @valid_attrs %{
    email: "hello@example.com",
    password: "121221121212",
    password_confirmation: "121221121212"
  }

  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "content-type", "application/json")}
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, registration_path(conn, :create), %{data: %{type: "user",
      attributes: @valid_attrs
      }}
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(User, %{email: @valid_attrs[:email]})
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    assert_error_sent 400, fn ->
      conn = post conn, registration_path(conn, :create),  %{data: %{type: "user",
        attributes: @invalid_attrs
      }}
    end
  end

end
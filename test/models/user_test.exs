defmodule HelloPhoenix.UserTest do
  use HelloPhoenix.ModelCase

  alias HelloPhoenix.User

  @valid_attrs %{bio: "my life", email: "pat@example.com", name: "Pat Example", number_of_pets: 4}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "number_of_pets is not required" do
    changeset = User.changeset(%User{}, Map.delete(@valid_attrs, :number_of_pets))
    assert changeset.valid?
  end

  test "bio must be at least two characters long" do
    attrs = %{@valid_attrs | bio: "I"}

    assert {:bio, {"should be at least %{count} characters", [count: 2]}} in errors_on(%User{}, attrs)
    # or
    # changeset = User.changeset(%User{}, attrs)
    # refute changeset.valid?
  end

  test "bio must be at most 140 characters long" do
    attrs = %{@valid_attrs | bio: long_string(141)}
    assert {:bio, {"should be at most %{count} characters", [count: 140]}} in errors_on(%User{}, attrs)
  end

  test "email must contain at least an @" do
    attrs = %{@valid_attrs | email: "fooexample.com"}
    assert {:email, "has invalid format"} in errors_on(%User{}, attrs)
  end
end

defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings representing a deck of cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    # Solution 1
    # cards = for value <- values do
    #   for suit <- suits do
    #     "#{value} of #{suit}"
    #   end
    # end
    # List.flatten(cards);

    # Solution 2
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end

  end

  @doc """
    Shuffle a deck of cards that was pass into it
  """

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Deteremin whether a deck of cards contain a given `card`
  ## Examples

      iex> deck = Cards.create_deck()
      iex> Cards.contains?(deck, "Ace of Spades")
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck of cards into hand and the remainders of the deck of cards
    The `hand_size` indicate the number of cards in the hand

  ## Examples

      iex> deck = Cards.create_deck()
      iex> {hand, _remainder} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Save a deck of cards into file where `filename` is the path to the file
  """

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Load a file indo Erlang where `filename` is the path to the file
  """

  def load(filename) do
    # Solution 1
    # {status, binary} = File.read(filename)
    # case status do
    #   :ok -> :erlang.binary_to_term(binary)
    #   :error -> "#{filename} does not exist"
    # end

    # Solution 2
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "#{filename} does not exist"
    end

  end

  def create_hand(hand_size) do
    # Solution 1
    # deck = Cards.create_deck()
    # deck = Cards.shuffle(deck)
    # _hand = Cards.deal(deck, hand_size)
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end

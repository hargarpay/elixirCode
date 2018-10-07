defmodule Cards do
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

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, String.capitalize(card))
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

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

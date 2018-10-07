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
end

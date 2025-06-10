using StaticArrays

abstract type HandType end
struct StandardHand <: HandType end
struct JokerHand <: HandType end

struct Hand{T <: HandType}
    cards::SVector{5, Int8}
    bid::Int
end

function day07(input::String = readInput(joinpath(@__DIR__, "..", "..", "data", "day07.txt")))
    hands = [Hand{StandardHand}(SVector{5, Int8}([_to_value(c) for c ∈ x[1]]), parse(Int, x[2])) for x ∈ split.(eachsplit(rstrip(input), "\n"), " ")]
    p1 = solve(hands)
    
    handsp2 = [Hand{JokerHand}(SVector{5, Int8}(map(x -> x == 11 ? 1 : x, hand.cards)), hand.bid) for hand ∈ hands]
    p2 = solve(handsp2)
    
    return [p1, p2]
end

function _to_value(c::Char)
    isdigit(c) && return Int8(c - '0')
    c == 'T' && return Int8(10)
    c == 'J' && return Int8(11)
    c == 'Q' && return Int8(12)
    c == 'K' && return Int8(13)
    c == 'A' && return Int8(14)
    return Int8(0)
end

function Base.isless(a::Hand{T}, b::Hand{T}) where T <: HandType
    score_a, score_b = score(a), score(b)
    score_a != score_b && return score_a < score_b
    
    for (v1, v2) ∈ zip(a.cards, b.cards)
        v1 != v2 && return v1 < v2
    end
    return false
end

function _score(cards::SVector{5, Int8})
    counts = MVector{15, Int8}(zeros(Int8, 15))  # Index 0 unused, 1-14 for card values
    
    @inbounds for card in cards
        counts[card + 1] += 1  # +1 because arrays are 1-indexed
    end
    
    # Count unique cards and find max frequency
    n_unique = 0
    max_count = 0
    @inbounds for i in 2:15  # Skip index 1 (card value 0)
        if counts[i] > 0
            n_unique += 1
            max_count = max(max_count, counts[i])
        end
    end
    
    if n_unique == 1
        return 7  # five of a kind
    elseif n_unique == 2
        return max_count == 4 ? 6 : 5  # four of a kind or full house
    elseif n_unique == 3
        return max_count == 3 ? 4 : 3  # three of a kind or two pair
    elseif n_unique == 4
        return 2  # one pair
    else
        return 1  # high card
    end
end

score(hand::Hand{StandardHand}) = _score(hand.cards)

function score(hand::Hand{JokerHand})
    njoker = count(==(1), hand.cards)
    njoker == 0 && return _score(hand.cards)
    
    if njoker == 5
        return 7  # five of a kind
    end
    
    # Use fixed array for counting non-joker cards
    counts = MVector{15, Int8}(zeros(Int8, 15))
    @inbounds for card in hand.cards
        if card != 1  # not a joker
            counts[card + 1] += 1
        end
    end
    
    # Find the most frequent non-joker card
    max_count = 0
    max_card_idx = 0
    @inbounds for i in 2:15
        if counts[i] > max_count
            max_count = counts[i]
            max_card_idx = i
        end
    end
    
    # Add jokers to the most frequent card
    counts[max_card_idx] += njoker
    
    # Count unique cards and find new max frequency
    n_unique = 0
    new_max_count = 0
    @inbounds for i in 2:15
        if counts[i] > 0
            n_unique += 1
            new_max_count = max(new_max_count, counts[i])
        end
    end
    
    if n_unique == 1
        return 7  # five of a kind
    elseif n_unique == 2
        return new_max_count == 4 ? 6 : 5  # four of a kind or full house
    elseif n_unique == 3
        return new_max_count == 3 ? 4 : 3  # three of a kind or two pair
    elseif n_unique == 4
        return 2  # one pair
    else
        return 1  # high card
    end
end

function solve(hands::Vector{Hand{T}}) where T <: HandType
    sort!(hands)
    return sum(i * hand.bid for (i, hand) ∈ enumerate(hands))
end
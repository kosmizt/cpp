import random

majors = [
    "The Fool/Le Mat", "The Magician/Le Bateleur", "The High Priestess/La Papesse",
    "The Empress/L'Impératrice", "The Emperor/L'Empereur", "The Hierophant/Le Pape",
    "The Lovers/L'Amoureux", "The Chariot/Le Chariot", "Justice/La Justice",
    "The Hermit/L'Hermite", "Wheel of Fortune/La Roue de Fortune", "Strenght/La Force",
    "The Hanged Man/Le Pendu", "XIII", "Temperance/Tempérance", "The Devil/Le Diable",
    "The Tower/La Maison Dieu", "The Star/L'Étoile", "The Moon/La Lune",
    "The Sun/Le Soleil", "Judgement/Le Jugement", "The World/Le Monde"
]

ranks = [
    "A", "2", "3", "4", "5", "6", "7", "8", "9", "10",
    "Page/Valet", "Knight/Cavalier", "Queen/Reine", "King/Roi"
]

suits = ["Wands/Bâtons", "Cups/Coupes", "Swords/Épées", "Pentacles/Deniers"]


def decode_card(n):
    if n < 22:
        return majors[n]

    n -= 22
    suit = suits[n // 14]
    rank = ranks[n % 14]

    return f"{rank} of {suit}"


def draw_cards(q=3):
    if q > 78:
        raise ValueError("Cannot draw more than 78 cards")
    
    deck = list(range(78))      # 0..77
    random.shuffle(deck)

    drawn = deck[:q]

    for pos, num in enumerate(drawn, 1):
        orientation = random.choice(["upright", "reversed"])

        # numerological reduction
        reduction = num
        while reduction > 9 and reduction not in (11, 22):
            reduction = sum(int(d) for d in str(reduction))

        print(
            f"{pos}. #{num:02d} | "
            f"{decode_card(num)} | "
            f"{orientation} | "
            f"numerology={reduction}"
        )


draw_cards()

# É um objeto que representa cada presente
# gift = {name: "Playstation 5", price: 4999}
# É uma lista com todos os presentes
GIFTS = []

def add(gift)
  GIFTS.push(gift)
end

def all_gifts
  return GIFTS
end
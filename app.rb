require 'csv'

# É um objeto que representa cada presente
# gift = {name: "Playstation 5", price: 4999}
# É uma lista com todos os presentes
GIFTS = []

def add(gift)
  GIFTS.push(gift)
  save
end

def all_gifts
  return GIFTS
end

def find(index)
  GIFTS[index]
end

def destroy(index)
  GIFTS.delete_at(index)
  save
end

def mark_gift(index)
  # 1. A partir do index, procurar na lista qual é o presente
  # 2. Marca o presente como comprado ( bought = 1 )
  # 3. Salva o CSV
  gift = find(index)
  # gift = {name: "Playstation 5", price: 4999, bought: 0}
  gift[:bought] = 1
  # gift = {name: "Playstation 5", price: 4999, bought: 1}
  save
end

def load
  CSV.foreach('gifts.csv', headers: :first_row) do |row|
    # row = ["Playstion 5", "999", "0"]
    # row = {"name" => "Playstation 5", "price" => "999", "bought": "0"}
    gift = {name: row['name'], price: row['price'].to_i, bought: row['bought'].to_i}
    add(gift)
  end
end

def save
  # 1. Abrir o CSV em modo de escrita 
  # 2. Cria os headers dentro do CSV
  # 3. Iterar sobre os presentes que estão na MEMORIA (GIFTS)
  CSV.open('gifts.csv', 'wb') do |file|
    file << ['name', 'price', 'bought']
    GIFTS.each do |gift|
      file << [gift[:name], gift[:price], gift[:bought]]
    end
  end
end
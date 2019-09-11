# Constant declaration
ALLERGY_DATA = {
    "eggs":         1,
    "peanuts":      2,
    "shellfish":    4,
    "strawberries": 8,
    "tomatoes":     16,
    "chocolate":    32,
    "pollen":       64,
    "cats":         128,
}

puts "Insert patient score: "
while true do
    
    score = gets.chomp()

    begin
        score = Float(score)
        break
    rescue
        puts "Wrong input. Insert patient score: "
        next
    end

end

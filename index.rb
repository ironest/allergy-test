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

def get_patient_allergies( score )

    patient = {}

    while score > 0 do

        ALLERGY_DATA.each do |key, value|

            if value <= score and 2*value > score
                patient[key] = value
                score -= value
            else
                next
            end
        end
    end

    return patient

end

print "Insert patient score: "
while true do
    
    score = gets.chomp()

    begin
        score = Float(score)
        break
    rescue
        print "Wrong input. Try again: "
        next
    end

end

p get_patient_allergies(score)


# Constant declaration
ALLERGY_DATA = {
    "eggs" =>         1,
    "peanuts" =>      2,
    "shellfish" =>    4,
    "strawberries" => 8,
    "tomatoes" =>     16,
    "chocolate" =>    32,
    "pollen" =>       64,
    "cats" =>         128,
}


# Request a number from the command line; reiterates the request
# until a valid number is provided
def get_score()
    while true do
        score = gets.chomp()
        begin
            score = Float(score)
            break if score <= get_max_score()
        rescue
            # Do nothing and keep looping
        end
        print "Wrong input. Try again: "
    end
    return score
end


# Verifies if the provided score is within
# an acceptable range of values 
def get_max_score()
    max_score = 0
    ALLERGY_DATA.each do |key, value|
        max_score += value
    end
    return max_score
end


# Starting from a number, returns an array containing
# a list of strings. Each string is an allergy
def get_patient_allergies( score )
    patient = []
    while score > 0 do
        ALLERGY_DATA.each do |key, value|
            if value <= score and 2*value > score
                patient.push(key)
                score -= value
            else
                next
            end
        end
    end
    return patient
end


# Nicely prints to the terminal a report with the patient
# informatio, including name and a list of allergies
def print_allergies(pat)

    print "Patient #{pat["name"]} is allergic to: "
    if pat["allergy_list"].length == 0
        puts "nothing"
    else
        puts ""
        pat["allergy_list"].each do |value|
            puts " - #{value}"
        end
    end    

end


# Body of the program
patient_detail = {}

print "Insert patient name: "
patient_detail["name"] = gets.chomp

print "Insert patient score (0-#{get_max_score}): "
score = get_score()

patient_detail["allergy_list"] = get_patient_allergies(score)

print_allergies(patient_detail)



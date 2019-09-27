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


# Check if a patient is allergic to a given item
def check_item(pat)
    system("clear")
    puts "List of allergens: #{ALLERGY_DATA.keys.join(', ')}"
    puts "Enter the allergen you would like to check (or type 'exit' to go to previous menu)"

    item = nil
    while true
        item = gets.chomp()
        break if ALLERGY_DATA.include?(item)
        return if item.downcase == "exit"
        print "'#{item}' is not a recognized allergen. Try again: "
    end
    if pat["allergy_list"].include?(item)
        puts "POSITIVE, patient #{pat["name"]} is allergic to #{item}"
    else
        puts "NEGATIVE, patient #{pat["name"]} is not allergic to #{item}"
    end
    puts "\nPress ENTER to return to the MENU"
    gets.chomp()
end


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


# Request an option between 0, 1, 2; reiterates the request
# until a valid option is provided
def get_opt()
    valid_opt = ["0","1","2"]
    while true do
        opt = gets.chomp()
        break if valid_opt.include?(opt)
        print "Wrong option. Try again: "
    end
    return opt
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
    system("clear")
    print "Patient #{pat["name"]} is allergic to: "
    if pat["allergy_list"].length == 0
        puts "nothing"
    else
        puts ""
        pat["allergy_list"].each do |value|
            puts " - #{value}"
        end
    end
    puts "\nPress ENTER to return to the MENU"
    gets.chomp()
end


# Body of the program

system("clear")
patient_detail = {}

print "Insert patient name: "
patient_detail["name"] = gets.chomp

print "Insert patient score (0-#{get_max_score}): "
score = get_score()

patient_detail["allergy_list"] = get_patient_allergies(score)

while true do
    system("clear")
    puts "Please enter:\n" +
         " - 1 to check a specific item\n" +
         " - 2 to print a list of allergies\n" +
         " - 0 to exit the program"

    case get_opt()
    when "0"
        exit
    when "1"
        check_item(patient_detail)
    when "2"
        print_allergies(patient_detail)
    end

end



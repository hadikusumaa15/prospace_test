inputs = "glob is I
prok is V
pish is X
tegj is L
glob glob Silver is 34 Credits
glob prok Gold is 57800 Credits
pish pish Iron is 3910 Credits
how much is pish tegj glob glob ?
how many Credits is glob prok Silver ?
how many Credits is glob prok Gold ?
how many Credits is glob prok Iron ?
how much wood could a woodchuck chuck if a woodchuck could chuck wood ?"


saved_input = {}
error = false
inputs_arr = inputs.split("\n")
inputs_arr.each do |input|
    p input
end


def roman_checker(roman_numbers)
    total = 0
    error = false
    i_allowed = true
    v_allowed = true
    x_allowed = true
    l_allowed = true
    c_allowed = true
    d_allowed = true
    m_allowed = true
    i_length = 0
    v_length = 0
    x_length = 0
    l_length = 0
    c_length = 0
    d_length = 0
    m_length = 0

    def i_check(roman_number)
        roman_number == "I"
    end

    def v_check(roman_number)
        roman_number == "V"
    end

    def x_check(roman_number)
        roman_number == "X"
    end

    def l_check(roman_number)
        roman_number == "L"
    end

    def c_check(roman_number)
        roman_number == "C"
    end

    def d_check(roman_number)
        roman_number == "D"
    end

    def m_check(roman_number)
        roman_number == "M"
    end

    def max_three_check(total_length)
        if total_length >= 3
            return false
        else
            return true
        end
    end

    def max_one_check(total_length)
        if total_length >= 1
            return false
        else
            return true
        end
    end
    
    def check_roman_input(roman_numbers)
        roman_numbers - ["I", "V", "X", "L", "C", "D", "M"] != []
    end
        

    i = 0
    roman_numbers = roman_numbers.split("").reverse

    if check_roman_input(roman_numbers)
        error = true
    end

    while i < roman_numbers.length
        if error == false
            if i_check(roman_numbers[i]) && i_allowed
                i_length = i_length + 1
                i_allowed = max_three_check(i_length)
                total = total + 1
            elsif i_check(roman_numbers[i]) && (i_allowed == false)
                error = true
            end

            if v_check(roman_numbers[i]) && i_check(roman_numbers[i+1]) && v_allowed && i_allowed && (i_length == 0) 
                v_length = v_length + 1
                i_length = i_length + 1
                v_allowed = max_one_check(v_length)
                i_allowed = max_one_check(i_length)
                total = total + 4
                i = i + 1
            elsif v_check(roman_numbers[i]) && i_check(roman_numbers[i+1]) && v_allowed && i_allowed && (i_length > 0)
                error = true
            elsif v_check(roman_numbers[i]) && v_allowed
                v_length = v_length + 1
                v_allowed = max_one_check(v_length)
                i_allowed = false
                total = total + 5
            elsif v_check(roman_numbers[i]) && (v_allowed == false)
                error = true
            end

            if x_check(roman_numbers[i]) && i_check(roman_numbers[i+1]) && x_allowed && i_allowed && (i_length == 0) 
                x_length = x_length + 1
                i_length = i_length + 1
                x_allowed = max_one_check(x_length)
                v_allowed = false
                i_allowed = max_one_check(i_length)
                total = total + 9
                i = i + 1
            elsif x_check(roman_numbers[i]) && i_check(roman_numbers[i+1]) && x_allowed && i_allowed && (i_length > 0)
                error = true
            elsif x_check(roman_numbers[i]) && x_allowed
                x_length = x_length + 1
                x_allowed = max_three_check(x_length)
                v_allowed = false
                i_allowed = false
                total = total + 10
            elsif x_check(roman_numbers[i]) && (x_allowed == false)
                error = true
            end

            if l_check(roman_numbers[i]) && x_check(roman_numbers[i+1]) && l_allowed && x_allowed && (x_length == 0) 
                l_length = l_length + 1
                x_length = x_length + 1
                l_allowed = max_one_check(l_length)
                x_allowed = max_one_check(x_length)
                v_allowed = false
                i_allowed = false
                total = total + 40
                i = i + 1
            elsif l_check(roman_numbers[i]) && x_check(roman_numbers[i+1]) && l_allowed && x_allowed && (x_length > 0)
                error = true
            elsif l_check(roman_numbers[i]) && l_allowed
                l_length = l_length + 1
                l_allowed = max_one_check(l_length)
                x_allowed = false
                v_allowed = false
                i_allowed = false
                total = total + 50
            elsif l_check(roman_numbers[i]) && (l_allowed == false)
                error = true
            end

            if c_check(roman_numbers[i]) && x_check(roman_numbers[i+1]) && c_allowed && x_allowed && (x_length == 0) 
                c_length = c_length + 1
                x_length = x_length + 1
                c_allowed = max_one_check(c_length)
                l_allowed = false
                x_allowed = max_one_check(x_length)
                v_allowed = false
                i_allowed = false
                total = total + 90
                i = i + 1
            elsif c_check(roman_numbers[i]) && x_check(roman_numbers[i+1]) && c_allowed && x_allowed && (x_length > 0)
                error = true
            elsif c_check(roman_numbers[i]) && c_allowed
                c_length = c_length + 1
                c_allowed = max_three_check(c_length)
                l_allowed = false
                x_allowed = false
                v_allowed = false
                i_allowed = false
                total = total + 100
            elsif c_check(roman_numbers[i]) && (c_allowed == false)
                error = true
            end

            if d_check(roman_numbers[i]) && c_check(roman_numbers[i+1]) && d_allowed && c_allowed && (c_length == 0) 
                d_length = d_length + 1
                c_length = c_length + 1
                d_allowed = max_one_check(d_length)
                c_allowed = max_one_check(c_length)
                l_allowed = false
                x_allowed = false
                v_allowed = false
                i_allowed = false
                total = total + 400
                i = i + 1
            elsif d_check(roman_numbers[i]) && x_check(roman_numbers[i+1]) && d_allowed && c_allowed && (c_length > 0)
                error = true
            elsif d_check(roman_numbers[i]) && d_allowed
                d_length = d_length + 1
                d_allowed = max_one_check(d_length)
                c_allowed = false
                l_allowed = false
                x_allowed = false
                v_allowed = false
                i_allowed = false
                total = total + 500
            elsif d_check(roman_numbers[i]) && (d_allowed == false)
                error = true
            end

            if m_check(roman_numbers[i]) && c_check(roman_numbers[i+1]) && m_allowed && c_allowed && (c_length == 0) 
                m_length = m_length + 1
                c_length = c_length + 1
                m_allowed = max_one_check(m_length)
                d_allowed = false
                c_allowed = max_one_check(c_length)
                l_allowed = false
                x_allowed = false
                v_allowed = false
                i_allowed = false
                total = total + 900
                i = i + 1
            elsif m_check(roman_numbers[i]) && c_check(roman_numbers[i+1]) && m_allowed && c_allowed && (c_length > 0)
                error = true
            elsif m_check(roman_numbers[i]) && m_allowed
                m_length = m_length + 1
                m_allowed = max_three_check(m_length)
                d_allowed = false
                c_allowed = false
                l_allowed = false
                x_allowed = false
                v_allowed = false
                i_allowed = false
                total = total + 1000
            elsif m_check(roman_numbers[i]) && (m_allowed == false)
                error = true
            end

            i = i + 1
        else
            break
        end
    end

    if error == false
        return  total
    else
        return "not recognized!"
    end
end

def check_saved_keys(saved_keys = [], saved_input)
    if !saved_input.empty?
        saved_input.each do |saved_key|
            saved_keys.push(saved_key[0])
        end
    else
        saved_keys = []
    end
    return saved_keys
end

def check_nominaled_key(keys, saved_input)
    valid_input = false
    keysi = keys[1].split(" ")
    keyso = keys[0].split(" ")

    if (keysi.length == 2) && ( (keysi[0].to_i != 0) || (keysi[0] == "0") )
        valid_input = true
    end

    saved_keys = check_saved_keys([], saved_input)

    if ((keyso - saved_keys) != keyso) && ((keyso - saved_keys) == [keyso.last]) && valid_input
        return true
    else
        return false
    end
end

def check_how_much_question(input_split)
    ("how much" == input_split[0]) && (input_split[1].split(" ").last == "?")
end

def translate_alien_human(keys_arr, saved_input)
    roman_numbers = []
    keys_arr.each do |key|
        if !saved_input[key].nil?
            roman_numbers.push(saved_input[key])
        else
            roman_numbers = ["error"]
            break
        end
    end
    return roman_numbers
end

def check_how_many_question(input_split, saved_input)
    input_splito = input_split[0].split(" ")
    input_spliti = input_split[1].split(" ")
    if ( ["how", "many"] == [input_splito[0], input_splito[1]] ) && ( "?" == input_spliti.last )
        return true
    else
        return false
    end        
end

inputs_arr.each do |input|
    input_split = input.split(" is ")
    if input_split.length == 2
        if check_how_much_question(input_split)
            keys_arr = input_split[1].split(" ") - ["?"]
            roman_numbers = translate_alien_human(keys_arr, saved_input)
            if roman_numbers == ["error"]
                error = true
            end

            if error == false
                answer = roman_checker(roman_numbers.join(""))
            end 

            if error == false
                p "#{keys_arr.join(" ")} is #{answer}"
            else
                p "your input is invalid!"
            end

        elsif check_how_many_question(input_split, saved_input)
            input_splito = input_split[0].split(" ")
            input_spliti = input_split[1].split(" ")
            if input_splito.last == saved_input[input_spliti[-2]]["nominal"]
                value = saved_input[input_spliti[-2]]["value"].to_f
                alien_numbers = input_spliti - [input_spliti[-1], input_spliti[-2]]
                phrase = (input_spliti - [input_spliti[-1]]).join(" ")
                roman_numbers = translate_alien_human(alien_numbers, saved_input).join("")
                if roman_numbers != ["error"]
                    decimal_value = roman_checker(roman_numbers)
                    total = (value * decimal_value).to_i
                    answer = "#{phrase} is #{total} #{input_splito.last}"
                    p answer
                else
                    p "I have no idea what you are talking about"
                end
                
            else
                p "I have no idea what you are talking about"
            end

        elsif check_nominaled_key(input_split, saved_input)
            saved_keys = check_saved_keys([], saved_input)
            number_decimal = (input_split[1].split(" ").first).to_f
            keys_arr = input_split[0].split(" ")
            keys_arr = keys_arr - [keys_arr.last]
            roman_numbers = translate_alien_human(keys_arr, saved_input)
            if (roman_numbers != ["error"]) && (!roman_numbers.empty?)
                translated_roman = roman_checker(roman_numbers.join(""))
                value = number_decimal.to_f / translated_roman.to_f
            else
                value = 0
            end            
            
            saved_input[input_split[0].split(" ").last] = {}
            saved_input[input_split[0].split(" ").last]["nominal"] = input_split[1].split(" ").last
            saved_input[input_split[0].split(" ").last]["value"] = value
        else
            saved_input[input_split[0]] = input_split[1]
        end
    else
        p "I have no idea what you are talking about"
    end
end



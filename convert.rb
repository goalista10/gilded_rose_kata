def convert(num)
    num = num.to_f
    count = 1
    word = ""

    while num > 26
        num = num/26
        count = count + 1
    end

    while count != 0
        count = count - 1
        temp = num.to_i
        num = (num - temp) * 26
        temp = temp + 64
        word = word + temp.chr
    end
    return word
end




symbol = ['+','-','*','/']
output = ""
correct = 10
pass = Set()

function setnum(numbers)
    for first_symbol in symbol
        for second_symbol in symbol
            for third_symbol in symbol
                pattern1(numbers,first_symbol,second_symbol,third_symbol)
                pattern2(numbers,first_symbol,second_symbol,third_symbol)
                pattern3(numbers,first_symbol,second_symbol,third_symbol)
                pattern4(numbers,first_symbol,second_symbol,third_symbol)
                pattern5(numbers,first_symbol,second_symbol,third_symbol)
            end
        end
    end
end

function order(target)
    subli = copy(target)
    idx = 1
    for i in 1:4
        subli[1],subli[i] = subli[i],subli[1]
        for j in 1:3
            subli[3],subli[4] = subli[4],subli[3]
            push!(pass,copy(subli))
            subli[2],subli[4] = subli[4],subli[2]
            push!(pass,copy(subli))
        end
    end

    for x in pass
        setnum(x)
    end
end

function calc(op::Char,x,y)
    if op == '+'
        return x + y
    elseif op == '-'
        return x - y
    elseif op == '*'
        return x * y
    elseif op == '/'
        return x / y
    else
        println("ERROR")
        exit()
    end
end

#((a-b)-c)-d
function pattern1(nums,op1,op2,op3)
    if calc(op3, calc(op2, calc(op1, nums[1], nums[2]), nums[3]), nums[4]) == correct
        global output = "(($(nums[1])$(op1)$(nums[2]))$(op2)$(nums[3]))$(op3)$(nums[4])"
        finish()

    end
end

#(a-(b-c))-d
function pattern2(nums,op1,op2,op3)
    if calc(op3, calc(op1, nums[1], calc(op2, nums[2], nums[3])), nums[4]) == correct
        global output = "($(nums[1])$(op1)($(nums[2])$(op2)$(nums[3])))$(op3)$(nums[4])"
        finish()
    end
end

#a-((b-c)-d)
function pattern3(nums,op1,op2,op3)
    if calc(op1, nums[1], calc(op3, calc(op2, nums[2], nums[3]), nums[4])) == correct
        global output = "$(nums[1])$(op1)(($(nums[2])$(op2)$(nums[3]))$(op3)$(nums[4]))"
        finish()
    end
end

#a-(b-(c-d))
function pattern4(nums,op1,op2,op3)
    if calc(op1,nums[1], calc(op2, nums[2], calc(op3, nums[3], nums[4]))) == correct
       global output = "$(nums[1])$(op1)($(nums[2])$(op2)($(nums[3])$(op3)$(nums[4])))"
       finish()
    end
end

#(a-b)-(c-d)
function pattern5(nums,op1,op2,op3)
    if calc(op2, calc(op1, nums[1], nums[2]), calc(op3, nums[3], nums[4])) == correct
       global output = "($(nums[1])$(op1)$(nums[2]))$(op2)($(nums[3])$(op3)$(nums[4]))"
       finish()
    end
end

function finish()
    println(output)
end

function main()
    target = map(x->parse(Int,x),split(readline()))
    sort!(target)
    order(target)
end

main()
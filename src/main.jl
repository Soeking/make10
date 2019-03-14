symbol = ['+','-','*','/']
output = ""

function setnum(numbers)
    for first_symbol in symbol
        for second_symbol in symbol
            for third_symbol in symbol

            end
        end
    end
end

#((a-b)-c)-d
function pattern1()

end

#(a-(b-c))-d
function pattern2()

end


#a-((b-c)-d)
function pattern3()

end

#a-(b-(c-d))
function pattern4()

end


#(a-b)-(c-d)
function pattern5()

end

function calc()

end

function main()
    target = map(x->parse(Int,x),split(readline()))
    setnum(target)
end

main()
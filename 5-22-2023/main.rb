def test1(filename)
    myFile = File.new(filename, 'r')
    arr = myFile.readlines
    for i in 0...arr[0].to_i do
        line = arr[i + 1]
        args = line.split
        mid = 0
        if args[0].to_i < args[1].to_i
            if args[1].to_i < args[2].to_i
                mid = args[1].to_i
            else
                if args[2].to_i < args[0].to_i
                    mid = args[0].to_i
                else
                    mid = args[2].to_i
                end
            end
        else
            if args[1].to_i < args[2].to_i
                if args[2].to_i < args[0].to_i
                    mid = args[2].to_i
                else
                    mid = args[0].to_i
                end
            else
                mid = args[1].to_i
            end
        end
        puts mid
    end
end

def test2(filename)
    myFile = File.new(filename, 'r')
    arr = myFile.readlines
    for i in 0...arr[0].to_i do
        line = arr[i + 1]
        total = 0
        line.each_char do |c|
            total += c.to_i
        end
        puts total
    end
end

def main 
    filename = 'input.txt'
    test1 filename
    filename = 'input2.txt'
    test2 filename
end

main
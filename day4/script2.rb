counter = 0
infos={"byr" => false, "iyr" => false, "eyr" => false, "hgt" => false,"hcl" => false, "ecl" => false, "pid" => false, "cid" => false}
test = false
File.foreach("input") { |line|
    if line!="\n" and test==false
        for field in line.split(' ')
            fieldname=field.split(':')[0]
            value=field.split(':')[1]
            case
            when fieldname=="byr"
                infos[fieldname]=(Integer(value)>=1920 && Integer(value)<=2002)
            when fieldname=="iyr"
                infos[fieldname]=(Integer(value)>=2010 && Integer(value)<=2020)
            when fieldname=="eyr"
                infos[fieldname]=(Integer(value)>=2020 &&Integer(value)<=2030)
            when fieldname=="hgt"
                if value[-2..-1] == "in"
                    infos[fieldname]=(value[0..1]!~ /\D/ && Integer(value[0..1])>=59 && Integer(value[0..1])<=76)
                elsif value[-2..-1] == "cm"
                    infos[fieldname]=(value[0..2]!~ /\D/ && Integer(value[0..2])>=150 && Integer(value[0..2])<=193)
                end
            when fieldname=="hcl"
                if value[0]=="#"
                    value[0]=""
                    infos[fieldname]=(!value[/\H/])
                end
            when fieldname=="ecl"
                infos[fieldname]=(value=="amb" || value=="blu" || value=="brn" || value=="gry" || value=="grn" || value=="hzl" || value=="oth")
            when fieldname=="pid"
                infos[fieldname]=(value.length==9 && String(value)!~ /\D/)
            end
        end
    else
        if (infos["byr"] && infos["iyr"] && infos['eyr'] && infos["hgt"] && infos["hcl"] && infos["ecl"] && infos["pid"])
            counter=counter+1
        end
        infos={"byr" => false, "iyr" => false, "eyr" => false, "hgt" => false,"hcl" => false, "ecl" => false, "pid" => false, "cid" => false}
    end
}
if (infos["byr"] && infos["iyr"] && infos['eyr'] && infos["hgt"] && infos["hcl"] && infos["ecl"] && infos["pid"])
    counter=counter+1
end
puts counter
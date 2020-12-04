counter = 0
infos={"byr" => false, "iyr" => false, "eyr" => false, "hgt" => false,"hcl" => false, "ecl" => false, "pid" => false, "cid" => false}
test = false
File.foreach("input") { |line|
    if line!="\n" and test==false
        for field in line.split(' ')
            infos[field.split(':')[0]]=true
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
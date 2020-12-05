const { lstat } = require('fs');
const lineReader = require('line-reader');
id = 0
lineReader.eachLine('input', function(line,last) {
    row=[0,127];
    column=[0,7]
    for(letter=0;letter<line.length;letter++) {
        switch (line[letter]) {
            case "F":
                row[1]=row[1]-Math.round((row[1]-row[0])/2);
                break;
            case "B":
                row[0]=row[0]+Math.round((row[1]-row[0])/2);
                break;
            case "L":
                column[1]=column[1]-Math.round((column[1]-column[0])/2);
                break;
            case "R":
                column[0]=column[0]+Math.round((column[1]-column[0])/2);
                break;   
        }
        if(row[0]==row[1] && column[0]==column[1]) {
            tmp_id=row[0]*8+column[0];
            if(tmp_id>id) {
            global.id=tmp_id
            }
        }
    }
    if (last) {
        console.log(id)
    }
})
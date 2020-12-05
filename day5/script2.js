const lineReader = require('line-reader');
id = 0
ids=[]
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
            ids.push(row[0]*8+column[0]);;
        }
    }
    if(last) {
        ids.sort((a, b) => a - b);
        for(i=0;i<ids.length;i++) {
            if(ids[i]+1!=ids[i+1] && ids[i+1]!=null) {
                console.log(ids[i]+1)
            }
        }
    }
});

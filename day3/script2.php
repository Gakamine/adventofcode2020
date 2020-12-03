<?php
    $result = 1;
    foreach([[1,1],[3,1],[5,1],[7,1],[1,2]] as $array) {
        // echo trees($array[0],$array[1])."\n";
        $result=$result*trees($array[0],$array[1]);
    }
    echo $result;

    function trees($right,$down) {
        $counter = 0;
        $position = 0;
        $line_nb = 0;
        $firstline = true;
        $file = fopen("input", "r");
        while(!feof($file)) {
            $line=fgets($file);
            if((strlen($line)-1)>0) {
                if(!$firstline) {
                    if($line[$position]=="#" and $line_nb%$down==0) {
                        $counter++;
                    } 
                    if($line_nb%$down==0) {
                        $position=($position+$right)%(strlen($line)-1);
                    }
                } else {
                    $firstline=!$firstline;
                    $position=($position+$right)%(strlen($line)-1);
                }
                $line_nb++;
            }
        };
        fclose($file);
        return $counter;
    }
?>
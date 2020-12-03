<?php
    $file = fopen("input", "r");
    $counter = 0;
    $position = 0;
    $firstline=true;
    while(!feof($file))
    {
        $line=fgets($file);
        if((strlen($line)-1)>0) {
            if(!$firstline) {
                if($line[$position]=="#") {
                    $counter++;
                }
            } else {
                $firstline=!$firstline;
            }
            $position=($position+3)%(strlen($line)-1);
        }
    };
    fclose($file);
    echo $counter;
?>
<?php
$response = '[
    {
        "a" : "aaaaa",
        "b" : [
            {
                "c" : "c11",
                "d" : "d11",
                "f" : [ 5, 2 ]
            },
            {
                "c" : "c33",
                "d" : "d33",
                "f" : [ 5, 2 ]
            }
        ],
        "e" : 3
    },
    {
        "a" : "zzzzz",
        "b" : [
            {
                "c" : "c22",
                "d" : "d22",
                "f" : [ 9, 3 ]
            },
            {
                "c" : "c44",
                "d" : "d44",
                "f" : [ 9, 3 ]
            }
        ],
        "e" : 5
    }
    ]';
    // When set to true, 
    // the returned object will be array.
    $json = json_decode($response);
    foreach($json as $val){
        echo $val['a'].'<br>';
            foreach($val['b'] as $val1){
                echo $val1['c'].'<br>';
                echo $val1['d'].'<br>';
                    foreach ($val1['f'] as $val2){
                        echo $val2.'<br>';
                    }
            }
            echo $val['e'].'<br>';
    }
    // foreach($json as $val){
    //     foreach($val as $k => $a){
    //         echo $a.'<br>';
    //         if(is_array($a))
    //         foreach($a as $b)
    //             foreach($b as $w => $r)
    //             echo $r.'<br>';
    //             if(is_array($r))
    //             foreach($r as $t)
    //             echo $t.'<br>';
            
            
    //     }
    // }
$names = array('Mohammed','Ali','Salem','Amal','Amani','Samar','Shahad');

    echo '<form method="post">
    <input type="search" name="search_name" >
    <input type="submit" value="search">';

    foreach($names as $v){
        
        if(str_contains($v,$_POST['search_name']??null))
        echo "<h3>".$v."</h3>";
    
    }
    echo'</form>';

?>
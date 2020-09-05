<?php
    require_once 'config.php';
    require_once 'db_employees.php';

    $week_start = date("d-m-Y", strtotime('monday this week')); 
    $week_end = date("d-m-Y", strtotime('sunday this week'));

    $db = new database($pdo);

    $reports = $db->getReports($week_start, $week_end);

    //  $reports = $db->getReports("2020-09-07", "2020-09-13");

    $reports_week = reports_top3_employees($reports); // 

    show_with_formatting($reports_week); //  display in the console with the formatting as in the example 
  


    function show_with_formatting ($reports){

        $longest = get_max($reports);

        foreach ($reports as $day => $val) {
            echo "|" .str_pad($day, $longest['key'], " ", STR_PAD_BOTH)."|";
            echo " ".str_pad($val, $longest['val'])." |";
            echo "\n";
        }
         
    }

    function reports_top3_employees ($reports) { // week reports with best result employyes by hours

      $result = [];
      foreach ($reports as $day=>$employees){
          $result[$day] = "";
       
          if ($employees == "No data"){
             $result[$day] = "No data";
            continue;
          }      
        
          $employees = custom_multi_sort($employees,'hours');
  
          if(count($employees) > 3){
             
              $employees = array_slice($employees, 0, 3);
  
              for ($i = 0; $i < count($employees); $i++){
                $result[$day].= $employees[$i]['name']. " (".round($employees[$i]['hours'], 2).")";
                    if ($i !== count($employees)-1){ 
                      $result[$day].=", ";
                    }
              }
          }
  
          else {  
              for ($i = 0; $i < count($employees); $i++){
                $result[$day].= $employees[$i]['name']. " (".round($employees[$i]['hours'], 2).")";
                    if ($i !== count($employees)-1){ 
                      $result[$day].=", ";
                    }
              }
          }
      }
      return $result;
    }
      
    function custom_multi_sort($array,$field) { // sorting desc array by value from field

      $sortArr = array();
      foreach($array as $key=>$val){
          $sortArr[$key] = $val[$field];
      }

      array_multisort($sortArr, SORT_DESC, $array);
  
      return $array;
  }

  function get_max ($array){ // get the maximum length key and value in an array

    $longest['key'] = 0; 
    $longest['val'] = 0; 
      
    foreach ($array as $key => $val){

        if ($longest['key'] < strlen($key)){
            $longest['key'] = strlen($key);
        }

        if ($longest['val'] < strlen($val)){
            $longest['val'] = strlen($val);
        }
    }
    return $longest;

  }
   
?>


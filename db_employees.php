<?php

    class database
    {
     
        function __construct($pdo)
        {
            $this->pdo = $pdo;
        }

        function getReports ($from, $to) // if `date` has string type in US format M/d/YYYY 
        {

            $period = new DatePeriod(new DateTime($from), new DateInterval('P1D'), new DateTime ($to));

            $result = [];

            foreach ($period as $date) {

                $sql = "SELECT * FROM time_reports  
                        LEFT JOIN employees on time_reports.employee_id = employees.id
                        WHERE date =:date;
                ";
        
                $query = $this->pdo->prepare($sql);
               
                $query->execute(array(
                     ':date' => $date->format('n/j/Y'))
                 );

                $query = $query->fetchAll(PDO::FETCH_ASSOC);

                if ($query == null){
                      $result[$date->format('l')] = "No data";
                      continue;
                  }

                $i = 0;
                foreach ($query as $row){
                    $result[$date->format('l')][$i++] = $row;
                }

            }

            return $result;
        }

        function getReports_2 ($from, $to) // if `date` has date type in DB (format m/d/Y) 
        {

            $period = new DatePeriod(new DateTime($from), new DateInterval('P1D'), new DateTime ($to));

            $result = [];

            foreach ($period as $date) {

                $sql = "SELECT * FROM time_reports  
                        LEFT JOIN employees on time_reports.employee_id = employees.id
                        WHERE date =:date;
                ";
        
                $query = $this->pdo->prepare($sql);

                $query->execute(array(
                     ':date' => $date->format('Y-m-d'))
                 );

                $query = $query->fetchAll(PDO::FETCH_ASSOC);

                if ($query == null){
                      $result[$date->format('l')] = "No data";
                      continue;
                  }

                $i = 0;
                foreach ($query as $row){
                    $result[$date->format('l')][$i++] = $row;
                }

            }

            return $result;
        }

        

    }
?>
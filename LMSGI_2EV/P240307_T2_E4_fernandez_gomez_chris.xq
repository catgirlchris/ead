<html lang="es">
  <head>
  </head>
  <body>
    <h1>Listado de pruadores titulares y cambios</h1>
    <h3>Equipo titular local</h3>
    <ul>
    {
      for $pru in /pruebas_aptitud/pruebas/prueba
        let $pru_min := if ($pru/@valor_min) then
            concat("(mín. ", $pru/@valor_min, " ", $pru/@unidad, ")")
        let $pru_max := if ($pru/@valor_max) then
            concat("(máx. " ,$pru/@valor_max, " ", $pru/@unidad, ")")
          
        let $pru_text := concat($pru/@nombre, ": ", $pru_min, $pru_max)
        
        order by $pru/@nombre
        return <li>{$pru_text}<ul>
          {
          
            for $reslt in /pruebas_aptitud/resultados/resultado
              let $nombre_aspirante := /pruebas_aptitud/aspirantes/aspirante[@dni=$reslt/@aspirante_dni]/@nombre
              let $realizada := if ($reslt/@valor)
                                then "true" else "false"
                                
              let $valor := if ($reslt/@valor) then concat($reslt/@valor, " ", $pru/@unidad)
              let $estado := if ($realizada = "true") then
                               if ($pru/@valor_max)
                               then if ($reslt/@valor < $pru/@valor_max)
                                    then " (Superada)"
                                    else " (No superada)"
                               else if ($reslt/@valor > $pru/@valor_min)
                                    then " (Superada)"
                                    else " (No superada)"
                             else
                               " (No realizada)"
              let $orden := if ($estado = " (Superada)") then "1"
                            else if ($estado = " (No superada)") then "2"
                            else if ($estado = " (No realizada)") then "3"
              
              let $reslt_text := concat($nombre_aspirante, ": ", $valor, $estado)
              where $reslt/@prueba_id = $pru/@id
              order by $orden
              return <li>{$reslt_text}</li>
          
          }
        </ul>
        </li>
    }
    </ul>
  </body>
</html>
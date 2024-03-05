<html lang="es">
  <head>
  </head>
  <body>
    <h1>Listado de jugadores titulares y cambios</h1>
    <h3>Equipo titular local</h3>
    <ul>
    {
      for $jug in /rfmvb_resultado/equipo/dorsal
        let $j_rol := if ($jug/@libero = "true") then
            " (líbero)"
          else if ($jug/@capitan = "true") then
              " (capitan)"
            else
              ""
          
        let $nom_id := concat(substring($jug/@numero,3,4)," - ", $jug/@nombre, $j_rol) 
        where ($jug/../@rol = "local") and ($jug/@titular = "true")
        order by $jug/@id
        return <li>{$nom_id}</li>
    }
    </ul>
    <h3>Equipo titular visitante</h3>
    <ul>
    {
      for $jug in /rfmvb_resultado/equipo/dorsal
        let $j_rol := if ($jug/@libero = "true") then
            " (libero)"
          else if ($jug/@capitan = "true") then
              " (capitan)"
            else
              ""
          
        let $nom_id := concat(substring($jug/@numero,3,4)," - ", $jug/@nombre, $j_rol) 
        where ($jug/../@rol = "visitante") and ($jug/@titular = "true")
        order by $jug/@id
        return <li>{$nom_id}</li>
    }
    </ul>
    <h3>Cambios</h3>
    <ul>
    {
      for $cambio in /rfmvb_resultado/sets/set/cambio
        let $dorsal_sale := /rfmvb_resultado/equipo/dorsal[@numero=$cambio/@sale]
        let $dorsal_sale_text := concat("Sale: ", substring($dorsal_sale/@numero,3,5)," - ", $dorsal_sale/@nombre)
        
        let $dorsal_entra := /rfmvb_resultado/equipo/dorsal[@numero=$cambio/@entra]
        let $dorsal_entra_text := concat("Entra: ", substring($dorsal_entra/@numero,3,5)," - ", $dorsal_entra/@nombre)
        
        let $equipo_text := $dorsal_sale/../@rol
        let $nom_text := concat("Set ", substring($cambio/../@numero,3,3), " (", substring($cambio/@hora,1,5), "), cambio en equipo ", $equipo_text	)
        
        order by $cambio/@hora, $cambio/@sale
        return <li>
          {$nom_text}
          <ul>
            <li>{$dorsal_sale_text}</li>
            <li>{$dorsal_entra_text}</li>
          </ul>
        </li>
    }
    </ul>
  </body>
</html>



  
  

#! a. Crear el torneo con fechas de inicio y final.
db.periodoTorneo.insert({"Fecha Inicial":"09/05/2024","Fecha Final":"09/07/2024"})

#! b. Inscribir, modificar y eliminar equipos.
db.equipos.insert({"Nombre":"Los Angeles Lakers","Ciudad":"chicago")

db.equipos.update({_id:ObjectId("EQP000000000000000000002")}, {$set:{"Ciudad":"Los angeles"}})

db.equipos.deleteOne({"_id": ObjectId("EQP000000000000000000002")})

#! c.Inscribir, modificar y eliminar deportistas a los equipos.
db.deportistas.insert({"Nombre": "Hannona Left",
                       "Edad": 37,
                       "genero": "Masculino",
                       "Nacionalidad": "Estadounidense",
                       "Equipo": "Celtics",})

db.deportistas.update({"_id": ObjectId("DEP000000000000000000001")}, {$set: {"Nombre": "Esteban Marley"}})

db.deportistas.deleteOne({"_id": ObjectId("DEP000000000000000000001")})

#! d.Crear, modificar  y eliminar encuentros deportivos.
db.encuentros.insert({"Fecha": "09/05/2024",
                       "Hora": "12:00 pm",
                       "Lugar": "Olimpica Estadium",
                       "Equipo Local": "Warriors",
                       "Equipo Visitante": "Los Angeles Lakers",
                       "Estado": "Pendiente",
                       "Resultado Final": "N/A",
                       "Arbitros": [
                           "Guillermo Malaver"
                       ]})

db.encuentros.update({"_id": ObjectId("ENC000000000000000000001")},{
                       $set: {
                                "Estado": "Jugado",
                                "Resultado Final": "Victoria Visitante"
                            }
                       })

db.encuentros.deleteOne({"_id": ObjectId("ENC000000000000000000001")})


#! e.Registrar resultados de eventos deportivos.
db.tablaPosiciones.insert({"Posición": 3,
                           "Equipo": "DTM",
                           "Partidos Jugados": 2,
                           "Victorias": 2,
                           "Empates": 0,
                           "Derrotas": 0,
                           "Puntos": 6})

#! f.Reportar el ranking de los deportistas con mejor rendimiento
db.deportistas.find({"Ranking": { $gte: 8 }}, {"_id": 0, "Nombres": 1, "Apellidos": 1, "Ranking": 1}).sort({"Ranking": -1})
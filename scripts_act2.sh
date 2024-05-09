#! a. Crear el torneo con fechas de inicio y final.
db.periodoTorneo.insert({"Fecha Inicial":"05/12/2022","Fecha Final":"15/12/2023"})

#! b. Inscribir, modificar y eliminar equipos.
db.equipos.insert({"Nombre":"Equipo Prueba Soccer","Ciudad":"Barranquilla","Año":2001})

db.equipos.update({_id:ObjectId("61d7add6272dcce41b4ba6cd")}, {$set:{"Ciudad":"Pereira"}})

db.equipos.deleteOne({"_id": ObjectId("61d7add6272dcce41b4ba6cd")})

#! c.Inscribir, modificar y eliminar deportistas a los equipos.
db.deportistas.insert({"Nombres": "Mario Alberto",
                       "Apellidos": "Yepez",
                       "Edad": 25,
                       "Cedula": 10208132412,
                       "Celular": 3007802123,
                       "Equipo": "Deportivo Cali",
                       "Nacionalidad": "Colombiano",
                       "Ciudad": "Cali"
                       "Ranking": 8.3})

db.deportistas.update({"_id": ObjectId("65564657922f1ece3dfc70bb")},{
                       $set: {
                                "Nombres": "Esteban",
                                "Apellidos": "Mondragon"
                            }
                       })

db.deportistas.deleteOne({"_id": ObjectId("655630f5922f1ece3dfc7090")})

#! d.Crear, modificar  y eliminar encuentros deportivos.
db.encuentros.insert({"Fecha": "10/12/2023",
                       "Hora": "8:00 am",
                       "Lugar": "Pascual Guerrero",
                       "Equipo Local": "Deportivo Cali",
                       "Equipo Visitante": "Millonarios",
                       "Estado": "Jugando",
                       "Resultado Final": "Victoria",
                       "Arbitros": [
                           "Wilmar Roldan"
                       ]})

db.encuentros.update({"_id": ObjectId("6556316f922f1ece3dfc7092")},{
                       $set: {
                                "Estado": "Jugado",
                                "Resultado Final": "Victoria Visitante"
                            }
                       })

db.encuentros.deleteOne({"_id": ObjectId("61d725fb33c9f0547630c55f")})


#! e.Registrar resultados de eventos deportivos.
db.tablaposiciones.insert({"Posición": 3,
                           "Equipo": "Deportivo Cali",
                           "Partidos Jugados": 2,
                           "Victorias": 2,
                           "Empates": 0,
                           "Derrotas": 0,
                           "Puntos": 6})

#! f.Reportar el ranking de los deportistas con mejor rendimiento
db.deportistas.find({"Ranking": { $gte: 8 }}, {"_id": 0, "Nombres": 1, "Apellidos": 1, "Ranking": 1}).sort({"Ranking": -1})
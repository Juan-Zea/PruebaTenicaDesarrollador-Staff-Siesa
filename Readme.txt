En la api rest por favor modifique 

carpeta 
src/controllers/index.controller.js

const pool = new Pool({
    host:'localhost',
    user:'postgres',
    password:'1234',
    database:'MascotasYMascotas',
    port:'5432'
})

modifique la constante pool con la configuración de su postgreSQL.

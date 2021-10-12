const {Pool} = require('pg')

const pool = new Pool({
    host:'localhost',
    user:'postgres',
    password:'1234',
    database:'MascotasYMascotas',
    port:'5432'
})

const getTipoMascoCant = async(req,res)=>{
    const response = await pool.query('SELECT tipo.descripcion,count (*)as cantidad FROM public.mascota as masco,public.tipo_mascota as tipo where masco.tipo_mascota = tipo.id_tipo group by tipo.descripcion;');
    console.log(response.rows)
    res.status(200).json(response.rows)
}

module.exports = {
    getTipoMascoCant
}
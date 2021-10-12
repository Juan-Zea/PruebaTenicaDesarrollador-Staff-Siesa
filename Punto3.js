// En consola porfavor ingrese los numeros separados por espacio excepto por el ultimo numero Gracias
const readline = require('readline')

var introduce;
let arregloNumeros= [];

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  })


const question1 = () => {
    return new Promise((resolve, reject) => {
      rl.question('numero 1: ', (answer) => {
        console.log(answer)
        introduce=answer
        resolve()
      })
    })
  }

  function pasarCanedaArreglo(cad){
    arregloNumeros=cad.split(' ')
  }

  function divisoresArreglo(){
      arregloNumeros.map(nume=>{
        let parseNumer = parseInt(nume) 
        let divisores = []
        for (numeros=1;numeros < parseNumer; numeros++) {
            if(parseNumer%numeros===0)
            {
                divisores.push (numeros)
            }
        }
        console.log(`numero: ${nume} , divisores:${divisores}, es Perfecto: `+isPerfecto(parseNumer,divisores))
      })
  }

  function isPerfecto(num,arr){
    let suma= 0
    arr.map(nu=>{
        suma = suma+nu
    })
    if(suma===num){
        return true
    }else{
        return false
    }
  }


  const main = async () => {
    await question1()
    rl.close()
    pasarCanedaArreglo(introduce)
    divisoresArreglo()
  }
  
  main()
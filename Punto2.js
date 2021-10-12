const readline = require('readline')

let num1 = 0
let num2 = 0

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  })
  
  const question1 = () => {
    return new Promise((resolve, reject) => {
      rl.question('numero 1: ', (answer) => {
        console.log(answer)
        num1=answer
        resolve()
      })
    })
  }
  
  const question2 = () => {
    return new Promise((resolve, reject) => {
      rl.question('numero 2: ', (answer) => {
        console.log(answer)
        num2 =answer
        resolve()
      })
    })
  }
  
  function oparacionDividir(numero1,numero2){
      if(!(numero1 - Math.floor(numero1)===0)){
        console.log(numero1+' -el numero no es entero')
      }else if (!(numero2-Math.floor(numero2)===0)){
        console.log(numero2+" -el numero ingresado no es un entero")
      }else{
          let div = num1/num2
          console.log('El resultado es:'+div)
      }
  }


  const main = async () => {
    await question1()
    await question2()
    rl.close()
    oparacionDividir(num1,num2)
  }
  
  main()
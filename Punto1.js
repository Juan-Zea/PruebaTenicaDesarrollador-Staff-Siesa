let valor = 5

function metodoQueHaceAlgo(valor){

    if( valor<3){
       return valor
    }else {
        return metodoQueHaceAlgo(valor-1)*metodoQueHaceAlgo(valor-2)
    }
}

console.log(metodoQueHaceAlgo(valor))

// El resultado es 8.

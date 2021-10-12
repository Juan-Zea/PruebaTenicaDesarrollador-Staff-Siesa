const {Router}= require('express')
const router = Router()
const {getTipoMascoCant} = require('../controllers/index.controller')
router.get('/getTipomascotacantidad',getTipoMascoCant)

module.exports = router
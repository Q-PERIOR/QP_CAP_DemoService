const cds = require('@sap/cds')
const { Cities } = cds.entities

module.exports = cds.service.impl(srv => {
    srv.before('CREATE', 'Cities', (req) => {
        const db = srv.transaction(req)

        /*cds.transaction(req) .run (
            SELECT.from(Cities) .columns(CQL.max('ID').as("ID"))
        ) .then (items => 
            items.forEach (item => console.debug ('XXX', item.ID ))
        )*/

        req.data.state = 'My Test'

        console.debug('>>>', req.method, req.target.name, req.data.state)
    })
})
from odoo import fields, models, api


class Lectura(models.Model):
    _name = 'hoja.lectura'
    _description = 'Hoja Lecturas'
    _order = 'numero ASC'

    name = fields.Many2one('hr.employee', string="Empleado")
    numero = fields.Integer(string="N.º", related='name.numero', store=True)
    linea_hoja_lectura_ids = fields.One2many('linea.hoja.lectura', 'hoja_lectura_id', string="N.º", ondelete="cascade")

    '''Al buscar una Lectura la puede encontrar también por el campo numero.'''
    @api.model
    def name_search(self, name='', args=None, operator='ilike', limit=100):
        args = args or []
        domain = []
        
        if name:
            domain = ['|', ('name', operator, name), ('numero', operator, name)]

        lecturas = self.env['hoja.lectura'].search(domain + args, limit=limit)

        return lecturas.name_get()
    
    @api.onchange('name')
    def _onchange_numero(self):
        # Emitir la señal para informar al modelo hoja.lectura sobre el cambio
        self.env['linea.hoja.lectura'].sudo().search([]).write({})

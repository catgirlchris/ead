from odoo import fields, models, api, _

class AgendaTelefonica(models.Model):
    _name = 'agenda.telefonica'
    _description = 'Agenda telefónica de Chris Fernández Gómez'

    name = fields.Char(string="Nombre")
    phone = fields.Char(string="Teléfono")
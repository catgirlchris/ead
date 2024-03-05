from odoo import fields, models, api

class Cliente(models.Model):
    _name = 'vivero.cliente'
    _description = 'Cliente'

    name = fields.Char(string="Código zona")
    description = fields.Char(string="Descripción")
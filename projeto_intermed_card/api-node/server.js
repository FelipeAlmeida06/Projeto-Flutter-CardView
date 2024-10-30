const express = require('express');
const app = express();
const porta = 3000;

// dados dos monitores
const monitores = [
    // monitor Grabalos
    {
        id: 1,
        nome: 'Grabalos',
        horariosDeMonitoria: {
            segunda: ['7:30', '8:15', '9:00', '10:00', '10:45', '11:30'],
            terca: ['7:30', '8:15', '9:00'],
            quarta: ['7:30'],
            quinta: [],
            sexta: ['7:30', '8:15', '17:30', '19:00', '19:45'],
            sabado: []
        }
    },
]

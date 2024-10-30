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

    // monitora Beatriz
    {
        id: 2,
        nome: 'Beatriz',
        horariosDeMonitoria: {
            segunda: ['7:30', '8:15', '9:00', '10:00', '10:45', '11:30', '12:15'],
            terca: ['7:30', '8:15', '9:00'],
            quarta: [],
            quinta: [],
            sexta: ['7:30', '8:15', '17:30'],
            sabado: []
        }
    },

    // monitor Marcos:
    {
        id: 3,
        nome: 'Marcos',
        horariosDeMonitoria: {
            segunda: ['8:15', '9:00', '10:00', '10:45', '11:30', '18:15'],
            terca: ['8:15', '9:00', '18:15'],
            quarta: [],
            quinta: [],
            sexta: ['8:15', '9:00', '10:00'],
            sabado: ['9:00', '9:45', '10:45', '11:30']
        }
    },

    // monitora Anna:
    {
        id: 4,
        nome: 'Anna',
        horariosDeMonitoria: {
            segunda: [],
            terca: ['10:00', '10:45', '11:30', '13:30'],
            quarta: ['10:00', '10:45', '11:30', '13:30'],
            quinta: ['10:00', '10:45', '11:30', '13:30', '14:15'],
            sexta: ['16:45', '17:30'],
            sabado: []
        }
    },

    // monitor Ricardo:
    {
        id: 5,
        nome: 'Ricardo',
        horariosDeMonitoria: {
            segunda: ['19:00', '19:45', '20:30', '21:30', '22:15'],
            terca: [],
            quarta: [],
            quinta: ['19:00', '19:45', '20:30', '21:30', '22:15'],
            sexta: ['12:15', '13:30', '14:15', '15:00', '16:00', '16:45', '17:30'],
            sabado: ['7:30', '8:15', '9:00', '10:00', '10:45', '11:30']
        }
    },
];

// Endpoint para buscar todos os monitores
app.get('/monitores', (req, res) => {
    res.json(monitores);
});

// Endpoint para buscar um monitor pelo ID
app.get('/monitores/:id', (req, res) => {
    const id = parseInt(req.params.id);
    const monitor = monitores.find(moni => moni.id === id);

    if (monitor) {
        res.json(monitor);
    } else {
        res.json(404).json({ mensagem: 'Monitor não encontrado' });
    }
});

// Rota principal
app.get('/', (req, res) => {
    res.send('API funcionando!');
});

// Iniciar o servidor
app.listen(porta, () => {
    console.log(`API rodando na porta ${porta}`);
});

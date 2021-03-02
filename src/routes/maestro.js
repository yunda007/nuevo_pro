const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/home', async(req, res) => {
    const product = await pool.query('select * from user');
    res.render('maestros/index', { product });
});
router.get('/agregar', async(req, res) => {
    const product = await pool.query('select * from materias');
    res.render('maestros/agregar', { product });
});

router.get('/edit/:id_maestro', async(req, res) => {
    const { id_materia } = req.params;
    const links = await pool.query('SELECT * FROM materias WHERE id_materia = ?', [id_materia]);
    console.log(maestro);
    res.render('maestro/edit', { link: links[0] });
});

router.post('/edit/:id_maestro', async(req, res) => {
    const { id } = req.params;
    const { materia } = req.body;
    const newLink = {
        materia
    };
    await pool.query('UPDATE materias set ? WHERE id_materia = ?', [newLink, id_materia]);
    req.flash('success', 'Link Updated Successfully');
    res.redirect('/maestro/materias');
});





router.post('/agregar', async(req, res) => {

    const { materia } = req.body;
    const newProducto = { materia };

    await pool.query('insert into materias set ?', [newProducto]);

    res.redirect('/maestros/agregar');
});

router.get('/delete/:id', async(req, res) => {
    const { id } = req.params;
    const tienda = await pool.query('delete from materias where id_materia=?', [id]);
    res.redirect('/maestros/agregar');
});
module.exports = router;
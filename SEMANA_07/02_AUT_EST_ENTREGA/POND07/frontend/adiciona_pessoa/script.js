api = 'http://127.0.0.1:3071'

$(document).ready(() => {
    users.list();
});

var users = {
    
    list() {
        $.ajax({
            url: api + '/users',
            type: 'GET',
            success: data => {
                var tx = '';
                tx += '<div class="insert" onclick="user.insert()">Inserir pessoa em seu currículo</div>';
                data.forEach(element => {
                    tx += '<div class="user">';
                        tx += '<div class="title">' + `${element.Nome} - ${element.Cargo}` + '</div>';
                        tx += '<div class="actions">';
                            tx += '<div class="action" onclick="user.update(' + element.id_pessoa + ',\'' + element.Nome + '\')">Editar</div>';
                            tx += '<div class="action" onclick="user.delete(' + element.id_pessoa + ')">Excluir</div>';
                        tx += '</div>';
                    tx += '</div>';
                });
                $('#main').html(tx);
            }
        });
        
    }
    
};

var user = {

    insert() {
        var Nome = prompt('Digite o nome:');
        var Cargo = prompt('Digite o cargo:');
        console.log(`${Nome} - ${Cargo}`);
        if (Nome && Cargo) {
            if (Nome.trim() != '' && Cargo.trim() != '') {
                $.ajax({
                    type: 'POST',
                    url: api + '/userinsert',
                    data: {Nome: Nome, Cargo: Cargo},
                }).done(function () {
                    users.list();
                }).fail(function (msg) {
                    //console.log('FAIL');
                }).always(function (msg) {
                    //console.log('ALWAYS');
                });
            }
        }
    },


    update(id_pessoa, oldTitle) {

        var Nome = prompt('Digite o novo nome:', oldTitle);
        if (Nome) {
            if (Nome.trim() != '') {
                $.ajax({
                    type: 'POST',
                    url: api + '/userupdate',
                    data: {Nome: Nome, id_pessoa: id_pessoa},
                }).done(function () {
                    users.list();
                }).fail(function (msg) {
                    //console.log('FAIL');
                }).always(function (msg) {
                    //console.log('ALWAYS');
                });
            }
        }
    },

    delete(id_pessoa) {

        if (confirm('Confirma a exclusão?')) {
            $.ajax({
                type: 'POST',
                url: api + '/userdelete',
                data: {id_pessoa: id_pessoa},
            }).done(function () {
                users.list();
            }).fail(function (msg) {
                //console.log('FAIL');
            }).always(function (msg) {
                //console.log('ALWAYS');
            });
        }
    },

}
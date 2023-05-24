$(document).ready(function() {
    $('#adicionar-dado').click(function() {
      var novoDado = $('#novo-dado').val();
      var novoItem = '<li><strong>Outro objetivo:</strong> ' + novoDado + '</li>';
      $('#dados-pessoais').append(novoItem);
    });
  });

  $(document).ready(function() {
    $('#adicionar-habilidade').click(function() {
      var novaHabilidade = $('#nova-habilidade').val();
      var novoItem0 = '<li><strong>Nova habilidade:</strong> ' + novaHabilidade + '</li>';
      $('#habilidades').append(novoItem0);
    });
  });



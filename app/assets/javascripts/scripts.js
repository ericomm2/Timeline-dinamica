function pressButton(id)
{
    var buttonId = '#botaoCurtida' + id;
    var curtidasID = '#curtidas' + id;
    if ($(buttonId).hasClass('btn-default')){
        $(buttonId).removeClass('btn-default');
        $(buttonId).addClass('btn-success');
        $(curtidasID).text(parseInt($(curtidasID).text())+1);
    }else{
        $(buttonId).removeClass('btn-success');
        $(buttonId).addClass('btn-default');
        $(curtidasID).text(parseInt($(curtidasID).text())-1);
    }
}
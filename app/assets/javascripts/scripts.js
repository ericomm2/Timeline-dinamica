function pressButton(id,post_id,user_id)
{
    var buttonId = '#botaoCurtida' + id;
    var curtidasID = '#curtidas' + id;
    if ($(buttonId).hasClass('btn-default')){
        $(buttonId).removeClass('btn-default');
        $(buttonId).addClass('btn-success');
        $(curtidasID).text(parseInt($(curtidasID).text())+1);
        $.get( "/addlike/"+post_id+"/"+user_id );
    }else{
        $(buttonId).removeClass('btn-success');
        $(buttonId).addClass('btn-default');
        $(curtidasID).text(parseInt($(curtidasID).text())-1);
        $.get( "/rmlike/"+post_id+"/"+user_id );
    }

}
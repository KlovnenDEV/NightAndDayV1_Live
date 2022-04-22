QBTablet = {}

$(document).ready(function(){
    $('.container').hide();

    window.addEventListener('message', function(event){
        var eventData = event.data;

        if (eventData.action == "ui") {
            if (eventData.toggle) {
                QBTablet.Open()
            }
        }
    });
});

$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27:
            QBTablet.Close();
            break;
    }
});

$(document).on('click', '#save', function(){
    $.post('http://denalifw-contracts/save', JSON.stringify({
        prace: $("accept").val(),
    }));
    QBTablet.Close();
});

$(document).on('click', '#home', function(){
    $.post('http://denalifw-contracts/home', JSON.stringify({
        homeprace: $("homeaccept").val(),
    }));
    QBTablet.Close();
});

$(document).on('click', '#return', function(){
    $.post('http://denalifw-contracts/return', JSON.stringify({
        cancelbutton: $("returnoffer").val(),
    }));
    QBTablet.Close();
});

$(document).on('click', '#cancel', function(){
    QBTablet.Close();
});

QBTablet.Open = function() {
    $.post('http://denalifw-contracts/checkItem', JSON.stringify({item: "tablet"}), function(hasItem){
        if (hasItem) {
            $('.container').fadeIn(250);
        }
    })
}

QBTablet.Close = function() {
    $('.container').fadeOut(250);
    $.post('http://denalifw-contracts/exit');
}
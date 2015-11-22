$(document).ready(function () {
    "use strict";

    var atual = 0,
        tamanho = 3,
        speed = 300,
        queue = jQuery({});

    function pausa(val) {
        var instance;

        switch (val) {
            case 0:
                instance = Processing.getInstanceById("mapaCanvas");
                instance.noLoop();
                break;
            case 1:
                instance = Processing.getInstanceById("pizzaCanvas");
                instance.noLoop();
                break;
            case 2:
                instance = Processing.getInstanceById("mediaCanvas");
                instance.noLoop();
                break;
        }
    }

    function inicia(val) {
        var instance;

        switch (val) {
            case 0:
                instance = Processing.getInstanceById("mapaCanvas");
                instance.loop();
                break;
            case 1:
                instance = Processing.getInstanceById("pizzaCanvas");
                instance.loop();
                break;
            case 2:
                instance = Processing.getInstanceById("mediaCanvas");
                instance.loop();
                break;
        }
    }



    $("#visualizacoesDiv div.visu:eq(" + atual + ")").css({
        opacity: "1"
    }).show();

    $("#slideLeft").click(function () {

        pausa(atual);

        $("#visualizacoesDiv div.visu:eq(" + atual + ")").animate({
            left: "200px",
            opacity: "0"
        }, speed / 2, function () {
            $(this).hide();
        });

        atual -= 1;

        if (atual < 0) {
            atual = tamanho - 1;
        }

        $("#visualizacoesDiv div.visu:eq(" + atual + ")").css({
            left: "-100px",
            opacity: "0"
        }).show();
        $("#visualizacoesDiv div.visu:eq(" + atual + ")").animate({
            left: "0px",
            opacity: "1"
        }, speed);

        inicia(atual);
    });

    $("#slideRight").click(function () {

        pausa(atual);

        $("#visualizacoesDiv div.visu:eq(" + atual + ")").animate({
            left: "-200px",
            opacity: "0"
        }, speed / 2, function () {
            $(this).hide();
        });

        atual += 1;

        if (atual >= tamanho) {
            atual = 0;
        }

        $("#visualizacoesDiv div.visu:eq(" + atual + ")").css({
            left: "100px",
            opacity: "0"
        }).show();
        $("#visualizacoesDiv div.visu:eq(" + atual + ")").animate({
            left: "0px",
            opacity: "1"
        }, speed);

        inicia(atual);
    });
});

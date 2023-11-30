function CrearCuenta() {
    $.ajax({
        type: 'POST',
        dataType: 'JSON',
        url: '/Home/CrearCuentaAjax',
        //data: { IdUsuario: idU },
        success: function (response) {
            let content = "Nombre de usuario: <input type='text' class='play' id='player' name='Nombre' placeholder='Ingrese su nombre'></input>"
            $("#CrearCuenta").html(content);
        }

    })
}


function MostrarMasInfo(idC) {
    $.ajax({
        type: 'POST',
        dataType: 'JSON',
        url: '/Home/MostrarMasInfoAjax',
        data: { Idconcierto: idC },
        success: function (response) {
            console.log(response);
            $("#FechaConcierto").html("Fecha del concierto: " + response.fechaConcierto);
            $("#Descripcion").html(response.descripcion);
            $("#Precio").html("Precio: " + response.descripcion);
        }
    });
}


function Likes(idJ, element) {
    let h6CantLikes = element.parentNode.children[2];
    let elementIsLiked = element.src.includes('CorazonBlanco.jpg');
    $.ajax({
        type: 'POST',
        dataType: 'JSON',
        url: '/Home/LikesAjax',
        data:
        {
            IdJuego: idJ,
            CantLikes: !elementIsLiked ? -1 : 1 
        },
        success: function (response) {
            console.log(response);
            if (elementIsLiked) element.src = '/Imagenes/CorazonRojo.jpg';
            else element.src = '/Imagenes/CorazonBlanco.jpg';
            h6CantLikes.innerText = response;
        }

    })
}
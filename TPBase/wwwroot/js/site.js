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
            $("#Precio").html("Precio: " + response.Precio);
        }
    });
}


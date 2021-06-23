import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netgrow/Widgets/Sensors_widgets/card.dart';

// MUY DIFEREnte EL WIDET DE TEMP , REVISAR SI  NO ES RESPONSIVE , SI FUNCIONA WP , SI NO REFACTOR EN FUNCION DE TEMPERATURA
// PUES ADIVINA QUE PENDEJO EXE DEL PASADO, NO FUNCIONA , HICISTE ALTO SPAGETTI CODE
// y AHORA EL EXE DEL FUTURO ESTA CARGANDO CON TUS PECADOS
// SHAME ON YOU
class LightWidget extends StatefulWidget {
  final bool estado;
  final nombre;

  LightWidget({
    Key? key,
    required this.estado,
    required this.nombre,
  })   : assert(nombre != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LightWidgetState();
  }
}

class _LightWidgetState extends State<LightWidget> {
  var estado;
  @override
  void initState() {
    estado = widget.estado;
    super.initState();
  }

  void _cardTap() {
    setState(() {
      estado = !estado;
    });
  }

  @override
  Widget build(BuildContext context) {
    const _paddingContent =
        EdgeInsets.symmetric(vertical: 5.0, horizontal: 6.0);

    var card = InkWell(
      onTap: _cardTap,
      child: DashboardCard(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
          child: Image.asset(
            estado
                ? r'assets\Imagenes\Sensores\Luz\bombilla_encendida.png'
                : r'assets\Imagenes\Sensores\Luz\bombilla.png',
          ),
        ),
        title: widget.nombre,
      ),
    );

    return card;
  }
}

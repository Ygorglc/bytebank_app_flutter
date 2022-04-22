import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
        body:  FormularioTransferencia(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {  },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget{
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Criando Transferência'),),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0,8.0,16.0,8.0),
            child: TextField(
              style: TextStyle(
                fontSize: 24.0
              ),
              decoration: InputDecoration(
                  labelText: 'Número da conta',
                  hintText: '0000'
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: TextStyle(
                fontSize: 24.0
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0.00'
              ),
            )
          ),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () {
              debugPrint('Clicou em Confirmar!!');
              final numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
              final valor =  double.tryParse(_controladorCampoValor.text);
              if(numeroConta != null && valor != null ){
                final transferenciaCriada = Tranferencia(valor, numeroConta);
                debugPrint('$transferenciaCriada');
              }
            },
          )
        ],
      ),
    );
  }
}

class Tranferencia{
  final double valor;
  final int numeroConta;

  Tranferencia(this.valor, this.numeroConta);
  
  @override
  String toString() {
    // TODO: implement toString
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}

class ItemTransferencia extends StatelessWidget{
  final Tranferencia _tranferencia;

  ItemTransferencia(this._tranferencia);

  @override
  Widget build(BuildContext context){
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_tranferencia.valor.toString()),
        subtitle: Text(_tranferencia.numeroConta.toString()),
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text('Transferências'),
        ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Tranferencia(100.0,1000)),
          ItemTransferencia(Tranferencia(200.0,2000)),
          ItemTransferencia(Tranferencia(300.0,3000)),
        ],
      ),
    );
  }
}


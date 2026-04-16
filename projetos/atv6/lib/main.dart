import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atividade de Cadastro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        scaffoldBackgroundColor: Colors.grey[100],
        useMaterial3: true,
      ),
      home: const CadastroScreen(),
    );
  }
}

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String? _sexoSelecionado;
  bool _termosAceitos = false;

  void _validarECadastrar() {
    String erro = "";

    int? idadeValida;
    try {
      idadeValida = int.tryParse(_idadeController.text);
    } catch (e) {
      idadeValida = null;
    }

    if (_nomeController.text.isEmpty) {
      erro = "O nome não pode ser vazio";
    } else if (idadeValida == null || idadeValida < 18) {
      erro = "Idade deve ser um número maior ou igual a 18";
    } else if (!_emailController.text.contains("@") || !_emailController.text.contains(".")) {
      erro = "E-mail inválido (deve conter @ e .)";
    } else if (_sexoSelecionado == null) {
      erro = "Selecione o sexo";
    } else if (!_termosAceitos) {
      erro = "Você precisa aceitar os termos de uso";
    }

    if (erro.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(erro), backgroundColor: Colors.red),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmacaoScreen(
            nome: _nomeController.text,
            idade: _idadeController.text,
            email: _emailController.text,
            sexo: _sexoSelecionado!,
            termos: _termosAceitos,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Usuário"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Preencha os campos abaixo",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              _buildTextField(_nomeController, "Nome", Icons.person, TextInputType.text),
              const SizedBox(height: 15),

              _buildTextField(_idadeController, "Idade", Icons.cake, TextInputType.number),
              const SizedBox(height: 15),

              _buildTextField(_emailController, "Email", Icons.email, TextInputType.emailAddress),
              const SizedBox(height: 15),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton<String>(
                  value: _sexoSelecionado,
                  hint: const Text("Selecione o Sexo"),
                  isExpanded: true,
                  underline: const SizedBox(),
                  items: ["Masculino", "Feminino", "Outro"].map((String value) {
                    return DropdownMenuItem<String>(value: value, child: Text(value));
                  }).toList(),
                  onChanged: (novoValor) {
                    setState(() => _sexoSelecionado = novoValor);
                  },
                ),
              ),
              const SizedBox(height: 15),

              Row(
                children: [
                  Checkbox(
                    value: _termosAceitos,
                    onChanged: (valor) => setState(() => _termosAceitos = valor!),
                  ),
                  const Text("Aceito os termos de uso"),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _validarECadastrar,
                  child: const Text("Cadastrar", style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, TextInputType keyboard) {
    return TextField(
      controller: controller,
      keyboardType: keyboard,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: label,
        hintText: "Informe seu $label",
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

class ConfirmacaoScreen extends StatelessWidget {
  final String nome, idade, email, sexo;
  final bool termos;

  const ConfirmacaoScreen({
    super.key,
    required this.nome,
    required this.idade,
    required this.email,
    required this.sexo,
    required this.termos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Confirmação"), backgroundColor: Colors.blue, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Dados Informados:", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Divider(),
            _infoRow("Nome", nome),
            _infoRow("Idade", idade),
            _infoRow("Email", email),
            _infoRow("Sexo", sexo),
            _infoRow("Termos aceitos", termos ? "Sim" : "Não"),
            const Spacer(),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Voltar"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Editar"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text("$label: $valor", style: const TextStyle(fontSize: 18)),
    );
  }
}
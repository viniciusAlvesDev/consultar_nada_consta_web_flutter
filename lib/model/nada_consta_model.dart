class NadaConstaModel {
  String? numero;
  String? dataEmisssao;
  String? periodo;
  String? condominioNumero;
  String? condominioNome;
  String? condominioEndereco;
  String? unidadeIdentificaor;

  NadaConstaModel(
      {this.numero,
      this.dataEmisssao,
      this.periodo,
      this.condominioNumero,
      this.condominioNome,
      this.condominioEndereco,
      this.unidadeIdentificaor});

  NadaConstaModel.fromJson(Map<String, dynamic> json) {
    numero = json['numero'];
    dataEmisssao = json['data_emisssao'];
    periodo = json['periodo'];
    condominioNumero = json['condominio_numero'];
    condominioNome = json['condominio_nome'];
    condominioEndereco = json['condominio_endereco'];
    unidadeIdentificaor = json['unidade_identificaor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numero'] = this.numero;
    data['data_emisssao'] = this.dataEmisssao;
    data['periodo'] = this.periodo;
    data['condominio_numero'] = this.condominioNumero;
    data['condominio_nome'] = this.condominioNome;
    data['condominio_endereco'] = this.condominioEndereco;
    data['unidade_identificaor'] = this.unidadeIdentificaor;
    return data;
  }
}
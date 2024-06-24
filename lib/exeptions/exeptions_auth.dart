
class ExeptionsAuth implements Exception {
  final String key;
  
  static const Map<String, String> erros = {
    'EMAIL_EXISTS': 'E-mail já cadastrado',
    'OPERATION_NOT_ALLOWED': 'Operação não permitida',
    'TOO_MANY_ATTEMPTS_TRY_LATER': 'Muitas tentativas, tente mais tarde',
    'EMAIL_NOT_FOUND': 'E-mail não encontrado',
    'INVALID_PASSWORD': 'Senha inválida',
    'USER_DISABLED': 'Usuário desativado',
    "INVALID_LOGIN_CREDENTIALS": 'Email ou senha inválidos',
  };

  ExeptionsAuth(this.key);

  @override
  String toString() {
    return erros[key] ?? 'Ocorreu um erro inesperado';
  }
}
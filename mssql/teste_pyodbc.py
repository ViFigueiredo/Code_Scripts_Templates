import pyodbc


def testar_conexao(server, database, username, password):
    conexao = None
    try:
        conexao = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=' +
                                 server+';DATABASE='+database+';UID='+username+';PWD=' + password)
        cursor = conexao.cursor()
        cursor.execute("SELECT 1")
        print("Conexão bem sucedida!")
    except pyodbc.Error as ex:
        print("Erro na conexão:", ex)
    finally:
        if conexao:
            conexao.close()


# Exemplo de uso:
# testar_conexao('meu_servidor', 'meu_banco_de_dados', 'meu_usuario', 'minha_senha')
testar_conexao('192.168.0.200\sqlserverfull', 'master', 'dbAdmin', 'Ctelecom2017')

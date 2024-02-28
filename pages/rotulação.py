import pandas as pd

# Carregar o DataFrame do CSV com a coluna de clusters
df = pd.read_csv('data/resultados_clusterizacao.csv')

# Adicionar uma coluna de rótulos ao DataFrame
df['rotulos'] = ''  # Inicialmente, deixe todos os rótulos em branco

# Rotular manualmente uma parte dos dados rotular os primeiros 20% das instâncias como "Treinamento" e o restante como "Teste"
num_rows = len(df)
df.iloc[:int(0.2*num_rows), -1] = 'Treinamento'  # Rotula as primeiras 20% das instâncias como "Treinamento"
df.iloc[int(0.2*num_rows):, -1] = 'Teste'  # Rotula o restante das instâncias como "Teste"

# Salvar o DataFrame modificado de volta em um arquivo CSV
df.to_csv('seu_arquivo_com_rotulos.csv', index=False)

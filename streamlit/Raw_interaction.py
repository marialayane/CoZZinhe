import pandas as pd

# Carregue apenas as colunas 'rating' e 'review' do CSV para um DataFrame do pandas
df = pd.read_csv('C:/Users/lucas/OneDrive/Faculdade/Pisi3/RAW_interactions.csv', usecols=['rating', 'review'])

# Escreva o DataFrame para um arquivo Parquet
df.to_parquet('RAW_Interaction_subset.parquet', index=False)

import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
from sklearn.preprocessing import LabelEncoder

# Carregar o DataFrame com os dados já clusterizados
df = pd.read_csv('data/seu_arquivo_com_rotulos.csv')

# Dividir os dados em recursos (X) e rótulos (y)
X = df.drop(['rotulos'], axis=1)  # Features
y = df['rotulos']  # Rótulos

# Criar uma cópia do DataFrame para evitar alterações no original
df_encoded = df.copy()

# Instanciar o codificador de rótulos
label_encoder = LabelEncoder()

# Codificar cada coluna categórica
for col in df_encoded.columns:
    if df_encoded[col].dtype == 'object':
        df_encoded[col] = label_encoder.fit_transform(df_encoded[col])

# Separar os dados em recursos (X) e rótulos (y)
X = df_encoded.drop('rotulos', axis=1)
y = df_encoded['rotulos']

# Dividir os dados em conjuntos de treinamento e teste
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Convertendo variáveis categóricas em representações numéricas binárias
X = pd.get_dummies(X)

# Inicializar o classificador RandomForest
rf_model = RandomForestClassifier(random_state=42)

# Treinar o modelo
rf_model.fit(X_train, y_train)

# Fazer previsões no conjunto de teste
y_pred = rf_model.predict(X_test)

# Calcular a precisão do modelo
accuracy = accuracy_score(y_test, y_pred)
print(f'Acurácia do modelo: {accuracy:.2f}')
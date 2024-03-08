import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.linear_model import Perceptron
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix, ConfusionMatrixDisplay
import matplotlib.pyplot as plt

# Carregar dados rotulados
data = pd.read_csv(r'C:\Users\ygor.nogueira\Documents\CoZZinhe-PISI-3\seu_arquivo_com_rotulos.csv')

# Selecionar apenas uma amostra dos dados
sample_data = data.sample(frac=0.5, random_state=42)

# Separar as características (entradas) das classes alvo
X = sample_data.drop(['rotulos'], axis=1) 
y = sample_data['rotulos']

# Codificar os rótulos com o OneHotEncoder
encoder = OneHotEncoder()

# Codificar as variáveis em cadeias binárias
categorical_cols = [col for col in X.columns if X[col].dtype == 'object']
transformed = encoder.fit_transform(X[categorical_cols])
transformed_df = pd.DataFrame(transformed.toarray(), columns=encoder.get_feature_names_out(categorical_cols))

# Drop das colunas categóricas do DataFrame original
X.drop(categorical_cols, axis=1, inplace=True)

# Concatenar as variáveis codificadas com as restantes
X = pd.concat([X.reset_index(drop=True), transformed_df], axis=1)

# Separar dados para teste
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Uniformizar os dados
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)

# Treinar o Perceptron
perceptron = Perceptron()
perceptron.fit(X_train_scaled, y_train)

# Iniciar previsões
y_pred = perceptron.predict(X_test_scaled)

# Avaliar o modelo
accuracy = accuracy_score(y_test, y_pred)
print("Acurácia do Perceptron:", accuracy)

# Calcular as métricas de precision, recall, f1-score e support
report = classification_report(y_test, y_pred)

# Imprimir as métricas calculadas acima
print("Relatório de Classificação:")
print(report)

# Calcular a matriz de confusão
cm = confusion_matrix(y_test, y_pred)

# Plotar a matriz de confusão
disp = ConfusionMatrixDisplay(confusion_matrix=cm, display_labels=perceptron.classes_)
disp.plot(cmap=plt.cm.Blues)
plt.title("Matriz de Confusão")
plt.show()

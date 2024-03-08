import pandas as pd
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.neighbors import KNeighborsClassifier
from imblearn.over_sampling import SMOTE
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix, ConfusionMatrixDisplay
import matplotlib.pyplot as plt

# Carregar dados rotulados
data = pd.read_csv('C:/Users/lucas/Downloads/finalPISI/seu_arquivo_com_rotulos.csv')

# Selecionar apenas uma amostra dos dados
sample_data = data.sample(frac=0.15, random_state=42)

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

# Dividir os dados em conjuntos de treinamento e teste
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=38)

# Normalizar os dados
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)

# Lidar com o desbalanceamento de classes usando oversampling (SMOTE)
smote = SMOTE(random_state=42)
X_train_resampled, y_train_resampled = smote.fit_resample(X_train_scaled, y_train)

# Ajustar hiperparâmetros do KNN usando GridSearchCV
param_grid = {'n_neighbors': [3, 5],
              'weights': ['uniform', 'distance'],
              'p': [1, 2]}  # 1 for Manhattan distance, 2 for Euclidean distance
knn = KNeighborsClassifier()
grid_search = GridSearchCV(knn, param_grid, cv=5, scoring='accuracy', n_jobs=-1)  # Adjusted n_jobs parameter
grid_search.fit(X_train_resampled, y_train_resampled)

# Obter o melhor modelo e fazer previsões
best_knn = grid_search.best_estimator_
y_pred = best_knn.predict(X_test_scaled)

# Avaliar o modelo
accuracy = accuracy_score(y_test, y_pred)
print("Acurácia do KNN melhorado:", accuracy)

# Calcular as métricas de precision, recall, f1-score e support
report = classification_report(y_test, y_pred)

# Imprimir as métricas de precision, recall, f1-score e support
print("Relatório de Classificação:")
print(report)

# Calcular a matriz de confusão
cm = confusion_matrix(y_test, y_pred)

# Plotar a matriz de confusão
disp = ConfusionMatrixDisplay(confusion_matrix=cm, display_labels=best_knn.classes_)
disp.plot(cmap=plt.cm.Blues)
plt.title("Matriz de Confusão - KNN melhorado")
plt.show()

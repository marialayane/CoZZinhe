"""Antigamente conhecido como teste 2, com o pre processamento da análise de dados + a exemplificaçção de erros
    + a regularização de código R1 - Lasso
"""

import pandas as pd
from sklearn.tree import DecisionTreeClassifier  # Importe DecisionTreeClassifier de sklearn.tree
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score, classification_report
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import confusion_matrix, ConfusionMatrixDisplay
import matplotlib.pyplot as plt

def preprocess(df):
    # Remover linhas duplicadas
    df = df.drop_duplicates()

    # Remover linhas com valores faltantes
    df = df.dropna()

    # Remover colunas desnecessárias
    colunas_a_remover = ['contributor_id', 'n_steps', 'n_steps', 'submitted', 'description']
    df = df.drop(colunas_a_remover, axis=1)

    return df

# Carregar o DataFrame com os dados já clusterizados
df = pd.read_csv('data/seu_arquivo_com_rotulos.csv')

# Dividir os dados em recursos (X) e rótulos (y)
X = df.drop(['ingredients'], axis=1)  # Features
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

# Inicializar o classificador da árvore de decisão
decision_tree = DecisionTreeClassifier(random_state=42)

# Treinar o modelo
decision_tree.fit(X_train, y_train)

# Fazer previsões no conjunto de teste
y_pred = decision_tree.predict(X_test)

# Avaliar a precisão do modelo
accuracy = accuracy_score(y_test, y_pred)
print(f'Acurácia do modelo: {accuracy:.2f}')

# Calcular a matriz de confusão
cm = confusion_matrix(y_test, y_pred)
print('Matriz de Confusão:')
print(cm)

# Identificar índices onde o modelo errou
erros_indices = (y_pred != y_test)

# Calcular o recall
recall = recall_score(y_test, y_pred, average='weighted')
print(f'Recall: {recall:.2f}')

# Calcular o F-score
f_score = f1_score(y_test, y_pred, average='weighted')
print(f'F-Score: {f_score:.2f}')

# Calcular a precisão
precision = precision_score(y_test, y_pred, average='micro')
print(f'Precisão: {precision:.2f}')

# Exibir o relatório de classificação
report = classification_report(y_test, y_pred)
print(report)

# Exibir a matriz de confusão
disp = ConfusionMatrixDisplay(confusion_matrix=cm, display_labels=decision_tree.classes_)
disp.plot()
plt.title('Matriz de Confusão')
plt.show()
import pandas as pd
import streamlit as st
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.cluster import KMeans
from sklearn.decomposition import PCA
import seaborn as sns
import matplotlib.pyplot as plt
import nltk
from nltk.corpus import stopwords

# Baixar a lista de stopwords do NLTK (caso ainda não tenha sido baixada)
nltk.download('stopwords')

# Função para realizar a clusterização com base no texto selecionado
def perform_clustering(df, text_column, n_clusters=5):
    # Preencher valores nulos nas colunas relevantes
    relevant_columns = ['name', 'tags', 'ingredients', 'description']
    df[relevant_columns] = df[relevant_columns].fillna('')

    # Personalizar lista de stopwords para remoção apenas ao clusterizar por descrição
    custom_stopwords = None
    if text_column == 'description':
        custom_stopwords = list(stopwords.words('english') + ['and', 'a', 'to', 'this', 'the', 'is', 'i', 'it', 'for', 'of', 'time'])

    # Vetorização dos dados de texto, removendo stopwords apenas para descrição
    vectorizer = TfidfVectorizer(stop_words=custom_stopwords)
    X = vectorizer.fit_transform(df[text_column])

    # Redução de dimensionalidade para visualização
    pca = PCA(n_components=2)
    X_pca = pca.fit_transform(X.toarray())

    # Aplicando o algoritmo de clusterização (K-Means)
    kmeans = KMeans(n_clusters=n_clusters, random_state=42)
    kmeans.fit(X)

    # Adicionando as informações de cluster ao DataFrame
    df['cluster'] = kmeans.labels_

    # Criando um dicionário para armazenar os elementos em comum de cada cluster
    cluster_elements = {}
    for cluster_label in range(n_clusters):
        cluster_elements[cluster_label] = df[df['cluster'] == cluster_label][relevant_columns].values.tolist()

    # Visualização dos clusters
    plt.figure(figsize=(10, 6))
    sns.scatterplot(x=X_pca[:, 0], y=X_pca[:, 1], hue=df['cluster'], palette='Set2', legend='full')
    plt.title('Clusterização de Receitas')
    plt.xlabel('Componente Principal 1')
    plt.ylabel('Componente Principal 2')
    plt.legend(title='Cluster')
    st.pyplot()

    return df, cluster_elements

# Leitura do CSV de receitas
df_recipes = pd.read_csv('C:/Users/lucas/OneDrive/Faculdade/Pisi3/RAW_recipes.csv')

# Redução do DataFrame para 10% do tamanho original
df_recipes_sampled = df_recipes.sample(frac=0.1, random_state=42)

# Selecionando apenas as colunas relevantes
df_recipes_sampled_relevant = df_recipes_sampled[['name', 'tags', 'ingredients', 'description']]

# Opções para escolha do elemento textual
text_options = ['ingredients', 'tags']
selected_text = st.selectbox('Escolha o elemento textual para clusterização:', text_options)

# Executar a clusterização com base no elemento textual selecionado
df_cluster, cluster_elements = perform_clustering(df_recipes_sampled_relevant, selected_text)

# Salvando os resultados da clusterização em um arquivo CSV
df_cluster.to_csv('resultados_clusterizacao.csv', index=False)

# Salvando os elementos em comum de cada cluster em um arquivo separado
with open('elementos_clusterizacao.txt', 'w') as f:
    for cluster_label, elements in cluster_elements.items():
        f.write(f"Cluster: {cluster_label}\n")
        for element in elements:
            f.write(f"{element}\n")
        f.write("\n")

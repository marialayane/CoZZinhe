import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import streamlit as st
from sklearn.impute import SimpleImputer
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.cluster import KMeans
from sklearn.decomposition import PCA
from collections import Counter
from wordcloud import WordCloud  # Importando o WordCloud
import nltk
from nltk.corpus import stopwords

# Baixar a lista de stopwords do NLTK (caso ainda não tenha sido baixada)
nltk.download('stopwords')

# Função para realizar a clusterização com base no texto selecionado
def perform_clustering(df, text_column, n_clusters=5):
    # Preencher valores nulos na coluna de descrição
    df[text_column] = df[text_column].fillna('')

    # Personalizar lista de stopwords para remoção apenas ao clusterizar por descrição
    if text_column == 'description':
        custom_stopwords = list(stopwords.words('english') + ['and', 'a', 'to', 'this', 'the', 'is', 'i', 'it', 'for', 'of', 'time'])
    else:
        custom_stopwords = None

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

    # Visualização dos clusters
    plt.figure(figsize=(10, 6))
    sns.scatterplot(x=X_pca[:, 0], y=X_pca[:, 1], hue=df['cluster'], palette='Set2', legend='full')
    plt.title('Clusterização de Receitas')
    plt.xlabel('Componente Principal 1')
    plt.ylabel('Componente Principal 2')
    plt.legend(title='Cluster')
    st.pyplot()

    return df

# Função para encontrar as palavras mais frequentes de cada cluster
def find_most_common_words(cluster_text):
    words = cluster_text.split()
    word_counts = Counter(words)
    most_common_words = word_counts.most_common(10)  # Obtém as 10 palavras mais frequentes
    return most_common_words

# Leitura do CSV de receitas
df_recipes = pd.read_csv('C:/Users/lucas/OneDrive/Faculdade/Pisi3/RAW_recipes.csv')

# Redução do DataFrame para 10% do tamanho original
df_recipes_sampled = df_recipes.sample(frac=0.1, random_state=42)

# Opções para escolha do elemento textual
text_options = ['tags', 'ingredients', 'description']
selected_text = st.selectbox('Escolha o elemento textual para clusterização:', text_options)

# Executar a clusterização com base no elemento textual selecionado
df_cluster = perform_clustering(df_recipes_sampled, selected_text)

# Encontrar e exibir as palavras mais frequentes de cada cluster em um gráfico de colunas e em um WordCloud
st.write("Palavras mais frequentes de cada cluster:")
for cluster_label in sorted(df_cluster['cluster'].unique()):
    cluster_points = df_cluster[df_cluster['cluster'] == cluster_label]
    cluster_text = ' '.join(cluster_points[selected_text])
    most_common_words = find_most_common_words(cluster_text)
    most_common_words_df = pd.DataFrame(most_common_words, columns=['Palavra', 'Frequência'])
    st.write(f"**Cluster {cluster_label + 1}:**")
    st.bar_chart(most_common_words_df.set_index('Palavra'))

    # Criar o WordCloud
    wordcloud = WordCloud(width=800, height=400, background_color='white').generate(cluster_text)

    # Exibir o WordCloud
    st.image(wordcloud.to_array())

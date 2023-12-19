import streamlit as st
import pandas as pd
from sklearn.cluster import KMeans
import matplotlib.pyplot as plt
import seaborn as sns

# Carregue o arquivo Parquet
df = pd.read_parquet('RAW_Interaction_subset.parquet')

# Cabeçalho do aplicativo Streamlit
st.title('Clusterização de Ratings')

# Sidebar para configurar o número de clusters
num_clusters = st.sidebar.slider('Número de Clusters', min_value=2, max_value=10, value=3)

# Realize a clusterização
kmeans = KMeans(n_clusters=num_clusters, random_state=42)
df['cluster'] = kmeans.fit_predict(df[['rating']])

# Exiba estatísticas dos clusters na barra lateral
st.sidebar.subheader('Estatísticas dos Clusters')
st.sidebar.write(df['cluster'].value_counts())

# Gráfico de Dispersão
scatter_fig, ax = plt.subplots()
colors = [f'C{i}' for i in range(num_clusters)]
for cluster, color in zip(range(num_clusters), colors):
    cluster_data = df[df['cluster'] == cluster]
    ax.scatter(cluster_data.index, cluster_data['rating'], label=f'Cluster {cluster}', color=color)
ax.set_xlabel('Índice')
ax.set_ylabel('Rating')
ax.legend()

# Adicione uma explicação para o Gráfico de Dispersão
st.subheader('Gráfico de Dispersão')
st.write(
    "O gráfico de dispersão acima mostra como os registros estão distribuídos nos clusters em relação aos ratings. "
    "Cada ponto representa uma entrada, e a cor indica a qual cluster ela pertence. "
    "Observe se existem padrões ou tendências notáveis."
)
# Exiba o gráfico de dispersão dos clusters
st.pyplot(scatter_fig)

# Mapa de Calor
heatmap_fig, ax = plt.subplots(figsize=(8, 6))
heatmap_data = df.pivot_table(index='cluster', columns='rating', aggfunc='size', fill_value=0)
sns.heatmap(heatmap_data, cmap='YlGnBu', annot=True, fmt='d', cbar_kws={'label': 'Contagem'})
ax.set_xlabel('Rating')
ax.set_ylabel('Cluster')

# Adicione uma explicação para o Mapa de Calor
st.subheader('Mapa de Calor')
st.write(
    "O mapa de calor fornece uma visão mais detalhada da distribuição de ratings dentro de cada cluster. "
    "As células mais escuras indicam uma contagem mais alta de registros para uma determinada combinação de cluster e rating. "
    "Identifique rapidamente onde os ratings são mais concentrados em cada cluster."
)
# Exiba o mapa de calor
st.pyplot(heatmap_fig)

# Tabela com Clusters
st.subheader('Tabela com Clusters')
st.dataframe(df[['rating', 'cluster']])

# Adicione uma explicação para a Tabela com Clusters
st.write(
    "A tabela exibe os ratings associados a cada cluster, permitindo uma inspeção detalhada dos registros. "
    "Verifique a distribuição de ratings dentro de cada cluster e identifique padrões específicos."
)

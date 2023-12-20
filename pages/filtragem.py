import streamlit as st
import pandas as pd

def show_filtragem():
    st.title("Página filtragem")
    # Adicione o conteúdo específico para a análise exploratória aqui
    st.write("Este é o conteúdo da página de filtragem.")
# Carregar dados do CSV
df = pd.read_csv('C:/Users/lucas/OneDrive/Faculdade/Pisi3/names/RAW_names.csv')

# Sidebar para inserção do nome do ingrediente
ingrediente_selecionado = st.sidebar.text_input('Digite o nome do ingrediente')

# Filtrando as receitas com base no ingrediente inserido
receitas_filtradas = df[df['ingredients'].str.contains(ingrediente_selecionado, case=False, na=False)]

# Exibindo a contagem de receitas com o ingrediente selecionado
st.write(f'Total de receitas com o ingrediente "{ingrediente_selecionado}": {len(receitas_filtradas)}')

# Exibindo as receitas filtradas
st.write('Receitas com o ingrediente selecionado:')
st.write(receitas_filtradas[['name', 'ingredients']])

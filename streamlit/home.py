import streamlit as st
import os

st.set_page_config(page_title="Minha Aplicação Streamlit", page_icon=":chart_with_upwards_trend:")

# Lista de páginas disponíveis na pasta 'pages'
pages_list = [f[:-3] for f in os.listdir("pages") if f.endswith(".py")]

# Adicione uma barra lateral para navegação
selected_page = st.sidebar.radio("Selecione uma página", pages_list)





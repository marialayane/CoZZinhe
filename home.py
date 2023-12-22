# main.py

import streamlit as st
import os
from PIL import Image  # Importe a classe Image da biblioteca PIL

st.set_page_config(page_title="Minha Aplicação Streamlit", page_icon=":chart_with_upwards_trend:")

# Lista de páginas disponíveis na pasta 'pages'
pages_list = [f[:-3] for f in os.listdir("pages") if f.endswith(".py")]


def mostrar_homepage():
    st.title("Bem-vindo ao Sistema de Recomendação de Receitas")
    
    st.write(
        "Este projeto utiliza um sistema de recomendação para ajudá-lo a descobrir receitas deliciosas! "
        "Explore e encontre novas ideias culinárias com base em suas preferências."
    )

    # Adicione uma imagem ilustrativa (substitua o caminho pela sua imagem)
    image = Image.open("pages/logo_cozzinhe.png")
    st.image(image, caption="Foto por Autor no Unsplash", use_column_width=True)

    st.write(
        "Navegue pela barra lateral para acessar diferentes funcionalidades do sistema, como "
        "filtragem por ingredientes, tipos de comida, e muito mais. Divirta-se explorando as receitas!"
    )
mostrar_homepage()

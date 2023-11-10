import numpy as np
import pandas as pd
import streamlit as st
import seaborn as sns
import matplotlib.pyplot as plt
import io
import altair as alt


def selecao_dos_dados(df_recipes, df_rating):
    st.write('# Seleção dos dados')
    st.write('---')
    st.write('Nesta seção, será feita a análise exploratória sobre um dataset de receitas culinárias, o “Food.com Recipes and Interactions” (2019).')
    st.write(' O dataset foi obtido no Kaggle, uma plataforma renomada para compartilhamento de conjuntos de dados e projetos relacionados a ciência de dados. Este dataset em particular foi contribuído pela usuária Shuyang Li e abrange mais de 180 mil receitas culinárias e mais de 700 mil avaliações feitas ao longo de 18 anos, representando um conjunto diversificado e rico em informações. As receitas contêm dados de nutrição, ingredientes e descrição. As interações contêm avaliações e notas. O dataset pode ser encontrado [aqui](https://www.kaggle.com/shuyangli94/food-com-recipes-and-user-interactions)') 
    st.write('---')


    # Dicionário de dados
    st.write('## Dicionário de dados')
    st.write('---')
    st.write('### Receitas')
    st.write('---')
    st.write('**name** - nome da receita')  
    st.write('**id** - identificador da receita')
    st.write('**minutes** - tempo de preparo da receita')
    st.write('**contributor_id** - identificador do usuário que contribuiu com a receita')
    st.write('**submitted** - data de submissão da receita')
    st.write('**tags** - tags da receita')
    st.write('**nutrition** - informações nutricionais da receita')
    st.write('**n_steps** - número de etapas da receita')
    st.write('**steps** - etapas da receita')
    st.write('**description** - descrição da receita')
    st.write('**ingredients** - ingredientes da receita')
    st.write('**n_ingredients** - número de ingredientes da receita')
    st.write('---')
    st.write('### Avaliações')
    st.write('---')
    st.write('**user_id** - identificador do usuário que fez a avaliação')
    st.write('**recipe_id** - identificador da receita avaliada')
    st.write('**date** - data da avaliação')
    st.write('**rating** - nota da avaliação')
    st.write('**review** - avaliação escrita')
    

    # Análise dos dados
    st.write('---')
    st.write('## Análise dos dados')
    st.write('---')
    st.write('### Receitas')
    st.write('---')
    st.write('#### Informações gerais')
    st.write('---')
    st.write('**Amostra:**')
    st.write(df_recipes.head())
    st.write('---')
    st.write('**Dimensões do dataset:**')
    st.write(df_recipes.shape)
    st.write('---')
    st.write('**Tipos de dados:**')
    st.write(df_recipes.dtypes)
    st.write('---')
    st.write('**Valores faltantes:**')
    st.write(df_recipes.isnull().sum())
    st.write('---')
    st.write('**Estatísticas descritivas:**')
    st.write(df_recipes.describe())
    st.write('---')

    st.write('### Avaliações')
    st.write('---')
    st.write('#### Informações gerais')
    st.write('---')
    st.write('**Amostra:**')
    st.write(df_rating.head())
    st.write('---')
    st.write('**Dimensões do dataset:**')
    st.write(df_rating.shape)
    st.write('---')
    st.write('**Tipos de dados:**')
    st.write(df_rating.dtypes)
    st.write('---')
    st.write('**Valores faltantes:**')
    st.write(df_rating.isnull().sum())
    st.write('---')
    st.write('**Estatísticas descritivas:**')
    st.write(df_rating.describe())
    st.write('---')
    
    return df_recipes, df_rating


def preprocessamento(df_recipes, df_rating):
    st.write('# Pré-processamento')
    st.write('---')
    st.write('O pré-processamento é uma etapa importante da análise exploratória, pois é nela que os dados brutos são transformados em dados que podem ser analisados. Nesta seção, serão feitas as seguintes etapas de pré-processamento:')
    

    st.write('---')
    st.write('---')
    st.write('## 1. Remoção de valores duplicados')
    st.write('A remoção de valores duplicados é uma etapa importante para a análise exploratória, pois a presença de valores duplicados pode causar distorções nos resultados. Para isso, verificaremos se há valores duplicados na base de dados.')
    # verificação de valores duplicados
    st.write('---')
    st.write('**Valores duplicados:**')
    st.write('***Receitas***')
    st.write(df_recipes.duplicated().sum())
    st.write(df_recipes[df_recipes.duplicated()])
    st.write('---')
    st.write('***Avaliações***')
    st.write(df_rating.duplicated().sum())
    st.write(df_rating[df_rating.duplicated()])
    st.write('---')
    st.write('Nenhum valor duplicado foi encontrado, por isso não foi necessário realizar a remoção. Caso houvesse valores duplicados, a função drop_duplicates() seria utilizada para removê-los.')


    st.write('---')
    st.write('---')
    st.write('## 2. Remoção de colunas desnecessárias')
    st.write('A fim de analisar de maneira mais precisa, foi realizada uma seleção inicial de colunas que serão utilizadas para a análise. Diante disso, as colunas "data_submissão” e "data" foram descartadas, uma vez que não estaremos lidando com dados temporais de avaliação ou submissão de receitas. Além disso, as colunas de "descrição", "tags" e "avaliação" foram consideradas irrelevantes devido à grande quantidade de dados nulos presentes. Também optou-se por não utilizar as colunas de identificação, como "id_contribuidor", "id_usuario" e "receita_id",  pois não seriam contribuintes para a análise e a coluna "receita_id" foi omitida por ser idêntica à coluna de identificador. ')
    # remoção de colunas desnecessárias
    df_recipes = df_recipes.drop(['submitted', 'description', 'tags', 'contributor_id', 'n_steps', 'n_ingredients'], axis=1)
    df_rating = df_rating.drop(['date', 'user_id', 'review'], axis=1)
    st.write('---')
    st.write('**Amostras:**')
    st.write('***Receitas***')
    st.write(df_recipes.head())
    st.write('---')
    st.write('***Avaliações***')
    st.write(df_rating.head())



    st.write('## 3. Remoção de valores faltantes')
    # verificação de valores faltantes
    st.write('---')
    st.write('**Valores faltantes:**')
    st.write('***Receitas***')
    st.write(df_recipes.isnull().sum())
    st.write('---')
    st.write('***Avaliações***')
    st.write(df_rating.isnull().sum())

    st.write('---')
    st.write('***Receitas***')
    st.write('Como apenas um nome está sem valor, foi decidido manter a linha que o contém.')

    st.write('---')
    st.write('***Avaliações***')
    st.write('Para o dataset de avaliações, não foi necessário remover os valores faltantes, pois não havia nenhum valor nulo.')

    st.write('---')
    st.write('---')
    st.write('## 4. Remoção de outliers')
    st.write('A remoção de outliers é uma etapa importante para a análise exploratória, pois a presença de outliers pode causar distorções nos resultados. Para isso, verificaremos se há outliers na base de dados.')
    st.write('---')
    st.write('*Receitas*')
    st.write('---')
    st.write('**Minutos**')
    st.write('Na base de dados, foram identificadas ocorrência de receitas com um tempo de preparo muito elevado, chegando a até 7 mil horas, situação extremamente incomum e, na maioria dos casos, não seria uma boa recomendação para a maior parte das pessoas. Considerando este fato e alinhando o propósito do trabalho, foi decidido remover receitas que apresentavam um tempo de preparo superior a 100 horas. Essa decisão resultou na remoção de 305 receitas do conjunto original, restando, assim, um total de 231331 receitas na base de dados.')

    # remoção de receitas com tempo maior que 6000 minutes
    var_minutes = df_recipes['minutes']
    st.write('**Antes:**')
    st.write(var_minutes.describe())
    df_recipes = df_recipes[df_recipes.minutes < 6000]
    var_minutes = df_recipes['minutes']
    st.write('**Depois:**')
    st.write(var_minutes.describe())
    st.write('Após essa filtragem de receitas, a variável “minutos” passou a ter uma média de 79,3 e um desvio padrão de aproximadamente 217,3. O tempo mínimo continuou sendo 0 e o máximo passou a ser 5970. Algo mais coerente com a proposta do trabalho.')
    
    return df_recipes, df_rating


def transformacao(df_recipes, df_rating):
    st.write('---')
    st.write('# Transformação dos dados')
    st.write('---')
    st.write('A transformação dos dados é uma etapa importante da análise exploratória, pois é nela que os dados são preparados para análise. Nesta seção, serão feitas as seguintes etapas de transformação:')
    
    # transformação de colunas de string em lista
    st.write('---')
    st.write('---')
    st.write('## Passos, Ingredientes e Nutrição')
    st.write('As colunas "passos", "ingredientes" e "nutrição" estavam representadas como strings que continham listas, o que dificultaria o acesso a dados específicos naquelas colunas. Por esse motivo, nós as convertemos em listas. Também foi criada uma coluna de tempo, que a partir da conversão da coluna de minutos, contém um dicionário com as chaves "horas" e "minutos", o que facilitará a verificação do tempo posteriormente.')
    # conversão de colunas
    df_recipes['steps'] = df_recipes['steps'].apply(lambda x: x.strip('[]').split(', '))
    df_recipes['ingredients'] = df_recipes['ingredients'].apply(lambda x: x.strip('[]').split(', '))
    df_recipes['nutrition'] = df_recipes['nutrition'].apply(lambda x: x.strip('{}').split(', '))
    
    # conversão de minutos em horas e minutos e criação de coluna de tempo
    st.write('---')
    st.write('---')
    st.write('## Tempo')
    st.write('A coluna "minutos" foi convertida em horas e minutos, e foi criada uma coluna de tempo, que contém um dicionário com as chaves "horas" e "minutos", o que facilitará a verificação do tempo posteriormente.')
    df_recipes['hours'] = df_recipes['minutes'].apply(lambda x: x//60)
    df_recipes['minutes'] = df_recipes['minutes'].apply(lambda x: x%60)
    df_recipes['time'] = df_recipes[['hours', 'minutes']].apply(lambda x: {'hours': x[0], 'minutes': x[1]}, axis=1)
    df_recipes = df_recipes.drop(['hours'], axis=1)
    st.write('**Amostra:**')
    st.write(df_recipes.head())

    # criando coluna de avaliação média
    st.write('---')
    st.write('---')
    st.write('## Avaliação média')
    st.write('A coluna "avaliação" foi convertida em float e foi criada uma coluna de avaliação média, que contém a média das avaliações de cada receita.')
    df_rating = df_rating.groupby('recipe_id')['rating'].mean()
    df_rating = pd.DataFrame(df_rating)
    df_rating = df_rating.reset_index()
    df_rating = df_rating.rename(columns={'rating': 'avg_rating'})
    st.dataframe(df_rating.head(5))
    st.write(df_rating.shape)


    # junta os dois dataframes
    st.write('---')
    st.write('---')
    st.write('## Junção dos dataframes')
    st.write('Para facilitar a análise, foi feita uma junção dos dois dataframes, utilizando a coluna de identificador de receita como chave.')
    df_rating["id"] = df_rating["recipe_id"]
    df_recipes["recipe_id"] = df_recipes["id"]
    df = pd.merge(df_recipes, df_rating, on=["id", "recipe_id"], how="left")
    st.write('**Amostra:**')
    st.write(df.head())

    return df



def analise_exploratoria(df):
    st.write('---')
    st.write('# Análise Exploratória')
    st.write('---')
    st.write('A análise exploratória fornecerá uma visão geral dos dados coletados. Os resultados da análise serão usados para orientar o desenvolvimento de hipóteses e para identificar variáveis que são importantes para o estudo. A análise exploratória também pode ajudar a determinar se os dados podem ser usados para atingir os objetivos do estudo ou se os dados coletados precisam ser aprimorados.')
def view_recipes(df):
    # Conhecer o dataset
    st.markdown(
        """
        ## Conhecendo o dataset
        """
    )
    st.write('---')
    st.write('\n')

    # Informações do dataset
    st.markdown('### Dataset de receitas (RAW_recipes)')
    buffer = io.StringIO()
    df.info(buf=buffer)
    s = buffer.getvalue()
    st.text(s)
    st.write('Observamos que o dataset possui 231637 linhas e 12 colunas. Delas, 5 são do tipo int e 7 do tipo object.')
    st.write('\n')

    st.markdown('### Colunas')
    st.write(df.columns)
    st.write('Abaixo, temos uma breve descrição de cada coluna:')
    st.write('name: nome da receita')
    st.write('id: identificador único da receita')
    st.write('minutes: tempo de preparo em minutos')
    st.write('contributor_id: identificador único do usuário que contribuiu com a receita')
    st.write('submitted: data de envio da receita')
    st.write('tags: tags da receita')
    st.write('nutrition: informações nutricionais da receita')
    st.write('n_steps: número de passos da receita')
    st.write('steps: passos da receita')
    st.write('description: descrição da receita')
    st.write('ingredients: ingredientes da receita')
    st.write('n_ingredients: número de ingredientes da receita')
    st.write('\n')

    st.markdown('---')
    # visualização dos dados
    st.markdown(
        """
        ## Visualização dos dados
        """
    )
    st.markdown('---')
    
    st.write('Abaixo, temos a distribuição de receitas por número de ingredientes')
    st.bar_chart(df.n_ingredients.value_counts())
    st.write('É possível notar que a maior parte das receitas possuem entre 5 e 11 ingredientes. Mais a frente avaliaremos os dados de maneira mais detalhada.')
    st.write('\n')

    st.write('Abaixo, temos a distribuição de receitas por número de passos')
    st.bar_chart(df.n_steps.value_counts())
    st.write('É possível notar que a maior parte das receitas possuem entre 5 e 11 passos. Mais a frente avaliaremos os dados de maneira mais detalhada.')
    st.markdown('---')

    # estatísticas descritivas
    st.markdown(
        """
        ## Estatísticas descritivas
        """
    )
    st.write('Em nossa seção de descrição estatística, fornecemos uma análise detalhada, apresentando contagens, médias, desvios padrão e outros insights estatísticos cruciais para que você compreenda a distribuição e a natureza dos dados.')
    st.markdown('---')
    st.write('\n')

    st.markdown('### Contagem de valores')
    st.write('Abaixo, temos a contagem de valores utilizando a função describe() do pandas.')
    st.dataframe(df.describe())
    st.write('Avaliando as colunas de n_steps e n_ingridients, é possível notar que a média de passos para uma receita é de 10 passos, com um desvio padrão de 5 passos. Já a média de ingredientes é de 10 ingredientes, com um desvio padrão de 4 ingredientes. Comportamento esperado, já que receitas mais complexas tendem a ter mais passos e ingredientes.')
    st.write('Já avaliando a coluna minutes, que se refere a quantidade de minutos que uma receita precisa para ser preparada, é possível notar uma alta variância, com um desvio padrão de 74366 horas. Isso pode ser explicado pela presença de outliers, pois existem receitas que levam muito tempo para serem preparadas, como por exemplo, receitas de fermentação de pães, que podem levar até 24 horas para ficarem prontas.')
    st.write('\n')

    st.markdown('### Valores únicos')
    st.dataframe(df.nunique())
    st.write('A pouca quantidade de valores únicos n_steps e n_ingridients, pode ser explicada pela análise anterior, que mostrou um desvio padrão relativamente baixo entre elas.')
    st.write('Algumas colunas como id, name, steps e ingridients mostram um alto número de valores únicos, o que é esperado, já que são colunas que contém dados textuais.')
    st.write('\n')

    st.markdown('### Correlação entre as variáveis')
    st.write('as colunas utilizadas para essa análise foram: minutes, n_steps, n_ingredients')
    df_variaveis = df.loc[:, ['minutes', 'n_steps', 'n_ingredients']]
    st.write(df_variaveis.corr())
    st.write('A correlação entre as variáveis é baixa, o que indica que elas não são muito dependentes entre si.')
    st.write('\n')

    st.markdown('### Dados Nulos')
    st.write(df.isnull().sum())
    st.write('É possível notar a presença de muitos valores nulos na coluna description. Essa coluna não será utilizada para a construção do modelo de recomendação, portanto, não será tratada.')
    st.write('\n')
    st.write('Utilizaremos apenas as colunas name, id, minutes, n_stepes, stepes, n_ingredients e ingredients para a construção do modelo de recomendação. As demais colunas e os valores nulos serão descartadas.')
    df_novo = df.loc[:, ['name', 'id', 'minutes', 'n_steps', 'steps', 'n_ingredients', 'ingredients']]
    df_novo = df_novo.dropna()
    st.markdown('---')

    # visualização dos dados do novo dataset
    st.markdown(
        """
        ## Novo dataset
        """
    )
    st.markdown('---')
    st.dataframe(df_novo.head(5))
    st.write('\n')
    st.markdown('### Dados nulos')
    st.write(df_novo.isnull().sum())
    st.write('O novo dataset não possui valores nulos.')

    return df_novo


def view_interaction(df):
    # conhecer o dataset
    st.markdown(
        """
        ## Conhecendo o dataset
        """
    )
    st.write('---')
    st.write('\n')

    # Informações do dataset
    st.markdown('### Dataset de interações (RAW_interactions)')
    buffer = io.StringIO()
    df.info(buf=buffer)
    s = buffer.getvalue()
    st.text(s)
    st.write('Observamos que o dataset possui 1132367 linhas e 5 colunas. Delas, 3 são do tipo int e 2 do tipo object.')
    st.write('\n')

    st.markdown('### Colunas')
    st.write(df.columns)
    st.write('Abaixo, temos uma breve descrição de cada coluna:')
    st.write('user_id: identificador único do usuário')
    st.write('recipe_id: identificador único da receita')
    st.write('date: data da interação')
    st.write('rating: avaliação da receita')
    st.write('review: avaliação da receita')
    st.write('\n')

    st.markdown('---')
    # visualização dos dados
    st.markdown(
        """
        ## Visualização dos dados
        """
    )
    st.markdown('---')

    st.write('Abaixo, temos a distribuição de avaliações por receita')
    st.bar_chart(df.recipe_id.value_counts())
    st.write('Visivelmente é possível notar que a maior parte das receitas recebeu menos de 200 avaliações. Mais a frente avaliaremos os dados de maneira mais detalhada.')
    st.markdown('---')

    # estatísticas descritivas
    st.markdown(
        """
        ## Estatísticas descritivas
        """
    )
    st.write('Em nossa seção de descrição estatística, fornecemos uma análise detalhada, apresentando contagens, médias, desvios padrão e outros insights estatísticos cruciais para que você compreenda a distribuição e a natureza dos dados.')
    st.markdown('---')
    st.write('\n')

    st.markdown('### Contagem de valores')
    st.write('Abaixo, temos a contagem de valores utilizando a função describe() do pandas.')
    st.dataframe(df.describe())
    st.write('É possível notar que não possui dados nulos entre as três colunas. As colunas de user_id e recipe_id não serão avaliadas, pois se tratam de identificadores únicos. Já a coluna de rating possui uma média de 4.41, com um desvio padrão de 1.26. Isso indica que a maior parte das receitas recebeu uma avaliação positiva.')
    st.write('\n')

    st.markdown('### Valores únicos')
    st.dataframe(df.nunique())
    st.write('A pouca quantidade de valores únicos user_id e recipe_id, pode ser explicada pelo fato de que um usuário pode votar mais de uma vez e uma receita pode ser avaliada por mais de um usuário. Já a coluna de rating possui uma quantidade de valores únicos esperada, já que é uma coluna que contém dados numéricos referentes a avaliação da receita que podem variar entre 0 e 5.')
    st.write('\n')
    st.write('Algumas colunas como date e review mostram um alto número de valores únicos, o que é esperado, já que são colunas que contém dados textuais.')
    st.write('\n')

    st.markdown('### Dados Nulos')
    st.write(df.isnull().sum())
    st.write('É possível notar a presença de muitos valores nulos na coluna review. Essa coluna não será utilizada para a construção do modelo de recomendação, portanto, não será tratada.')
    st.write('\n')

    st.markdown('---')
    # visualização dos dados do novo dataset
    st.markdown(
        """
        ## Novo dataset
        """
    )
    st.markdown('---')
    df_novo = df.loc[:, ['recipe_id', 'rating']]
    st.dataframe(df_novo.head(5))
    st.write('\n')

    st.markdown('### Dados nulos')
    st.write(df_novo.isnull().sum())
    st.write('O novo dataset não possui valores nulos.')
    
    return df_novo


def view_tratados(df_recipes_old, df_rating_old):
    df_recipes = df_recipes_old.loc[:, ['name', 'id', 'minutes', 'n_steps', 'steps', 'n_ingredients', 'ingredients']]
    df_recipes = df_recipes.dropna()
    df_rating = df_rating_old.loc[:, ['recipe_id', 'rating']]

    # média de avaliações por receita
    st.markdown(
        """
        ## Média de avaliações por receita
        """
    )   
    st.write('---')
    st.write('\n')
    df_rating = df_rating.groupby('recipe_id')['rating'].mean()
    df_rating = pd.DataFrame(df_rating)
    df_rating = df_rating.reset_index()
    df_rating = df_rating.rename(columns={'rating': 'avg_rating'})
    st.dataframe(df_rating.head(5))

    # merge dos datasets
    st.markdown(
        """
        ## Merge dos datasets
        """
    )

    st.write('---')
    st.write('\n')
    df_rating["id"] = df_rating["recipe_id"]
    df_recipes["recipe_id"] = df_recipes["id"]
    df = pd.merge(df_recipes, df_rating, on=["id", "recipe_id"], how="left")
    st.dataframe(df.head(5))

    # apagando colunas desnecessárias
    st.markdown(
        """
        ## Apagando colunas desnecessárias
        """
    )   
    st.write('---')
    st.write('\n')
    df = df.drop(columns=['id'])
    st.dataframe(df.head(5))
    st.write(df.columns)
    st.write('A coluna id foi apagada, pois estava duplicada.')
    st.write('\n')
    st.markdown('---')

    # analise dos dados tratados
    st.markdown(
        """
        ## Análise dos dados tratados
        """
    )
    st.write('---')
    st.write('\n')

    st.markdown('### Contagem de valores')
    st.write('Abaixo, temos a contagem de valores utilizando a função describe() do pandas.')
    st.dataframe(df.describe())
    st.write('Todas as colunas já foram tratadas anteriormente, exceto a coluna de rating que possui uma média de 4.41, com um desvio padrão de 1.26. Isso indica que a maior parte das receitas recebeu uma avaliação positiva.')
    st.write('\n')

    st.markdown('### Valores únicos')
    st.dataframe(df.nunique())
    st.write('A coluna de rating possui uma quantidade de valores únicos esperada, já que é uma coluna que contém dados numéricos referentes a avaliação da receita que podem variar entre 0 e 5.')

    st.markdown('### Correlação entre as variáveis')
    st.write('as colunas utilizadas para essa análise foram: minutes, n_steps, n_ingredients, avg_rating')
    df_variaveis = df.loc[:, ['minutes', 'n_steps', 'n_ingredients', 'avg_rating']]
    st.write(df_variaveis.corr())
    st.write('A correlação entre as variáveis é baixa, o que indica que elas não são muito dependentes entre si.')
    st.write('\n')

    st.markdown('### Dados Nulos')
    st.write(df.isnull().sum())
    st.write('É possível notar que não há mais valores nulos no dataset, pois ambos foram previamente tratados.')
    st.write('\n')


    # introdução
    st.markdown(
        """
        ## Introdução
        """
    )
    st.write('Neste projeto, realizamos uma análise exploratória de dados sobre um dataset de receitas culinárias. O dataset foi obtido no Kaggle, e pode ser encontrado [aqui](https://www.kaggle.com/shuyangli94/food-com-recipes-and-user-interactions).')
    st.write('O dataset contém 180K+ receitas e 700K+ interações de usuários com essas receitas. As receitas contêm dados de nutrição, ingredientes e avaliações. As interações contêm avaliações e tempo de preparo.')
    st.write('O objetivo deste projeto é realizar uma análise exploratória de dados, com o intuito de compreender melhor o dataset e extrair insights que possam ser úteis para a construção de um modelo de recomendação de receitas.')
    st.markdown('---')

    # carregando o dataset
    st.markdown(
        """
        #### Carregando o dataset...
        """
    )
    df_recipes = pd.read_csv('C:/Users/lanes/Dropbox/PC/Documents/#UFRPE/streamlit_teste/RAW_recipes.csv')
    df_rating = pd.read_csv('C:/Users/lanes/Dropbox/PC/Documents/#UFRPE/streamlit_teste/RAW_interactions.csv') 
    st.markdown('---')


    # sidebar
    st.sidebar.title('Dataset')
    st.sidebar.markdown('Selecione o dataset a ser visualizado')
    dataset = st.sidebar.selectbox('Escolha o dataset', ('RAW_recipes', 'RAW_interactions', 'Dados tratados'))
    if dataset == 'RAW_recipes':
        view_recipes(df_recipes)
    elif dataset == 'RAW_interactions':
        view_interaction(df_rating)
    else:
        view_tratados(df_recipes, df_rating)

    
    return df_recipes, df_rating


def main():
    # configurações da página
    st.set_page_config(page_title="Análise Exploratória", page_icon="📊")
    st.title('Análise Exploratória de Dados')
    st.markdown("---")
    # LEMBRAR DE ALTERAR O CAMINHO DOS ARQUIVOS
    df_recipes = pd.read_csv('C:/Users/lanes/Dropbox/PC/Documents/#UFRPE/streamlit_teste/RAW_recipes.csv')
    df_rating = pd.read_csv('C:/Users/lanes/Dropbox/PC/Documents/#UFRPE/streamlit_teste/RAW_interactions.csv') 
    st.markdown('---')

    df_recipes, df_rating = selecao_dos_dados(df_recipes, df_rating)
    df_recipes, df_rating = preprocessamento(df_recipes, df_rating)
    df_recipes, df_rating = transformacao(df_recipes, df_rating)
    # FALTA A PARTE DE ANÁLISE EXPLORATÓRIA. add os graficos aqui
    df_recipes, df_rating = analise_exploratoria(df_recipes, df_rating)


if __name__ == '__main__':
    main()

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

    return df_recipes, df_rating



def analise_exploratoria(df_recipes, df_rating):
    st.write('---')
    st.write('# Análise Exploratória')
    st.write('---')
    st.write('A análise exploratória fornecerá uma visão geral dos dados coletados. Os resultados da análise serão usados para orientar o desenvolvimento de hipóteses e para identificar variáveis que são importantes para o estudo. A análise exploratória também pode ajudar a determinar se os dados podem ser usados para atingir os objetivos do estudo ou se os dados coletados precisam ser aprimorados.')

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

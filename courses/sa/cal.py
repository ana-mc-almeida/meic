def media_setenta_porcento_melhores(notas):
    if not notas:
        return 0  # Retorna 0 se a lista estiver vazia
    
    # Ordena as notas em ordem decrescente
    notas_ordenadas = sorted(notas, reverse=True)
    
    # Calcula o número de notas que representa 70%
    quantidade_melhores = int(len(notas) * 0.7)
    print("Quantidade de melhores notas:", quantidade_melhores, "de", len(notas))
    
    # Seleciona as 70% melhores notas
    melhores_notas = notas_ordenadas[:quantidade_melhores]
    
    # Calcula a média das 70% melhores notas
    media = sum(melhores_notas) / len(melhores_notas)
    
    return media

# Exemplo de uso
notas = [15,15]
resultado = media_setenta_porcento_melhores(notas)
print("A média das 70% melhores notas é:", resultado)

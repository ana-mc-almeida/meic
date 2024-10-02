import os
import argparse
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from PIL import Image

def create_pdf_from_images(input_folder, output_file, images_per_page=6):
    # Listar todas as imagens no diretório de entrada
    image_files = [f for f in os.listdir(input_folder) if f.lower().endswith(('.jpg', '.jpeg', '.png'))]
    
    c = canvas.Canvas(output_file, pagesize=letter)
    width, height = letter
    
    images_count = len(image_files)
    current_image = 0
    
    margin = 50  # Margem de 50px nas laterais
    max_img_width = width - 2 * margin  # Largura máxima da imagem com margens
    
    while current_image < images_count:
        y_offset = height - margin  # Iniciar perto do topo da página, respeitando a margem superior

        for _ in range(images_per_page):
            if current_image >= images_count:
                break
            
            image_path = os.path.join(input_folder, image_files[current_image])
            img = Image.open(image_path)
            
            # Redimensionar a imagem para a largura máxima da página (mantendo a proporção)
            img.thumbnail((max_img_width, height), Image.LANCZOS)
            
            img_width, img_height = img.size

            # Verificar se há espaço suficiente na página para a próxima imagem
            if y_offset - img_height < margin:
                # Se não houver espaço suficiente, inicie uma nova página
                c.showPage()
                y_offset = height - margin  # Resetar o y_offset no topo da nova página

            # Posicionar a imagem no PDF
            c.drawInlineImage(image_path, margin, y_offset - img_height, img_width, img_height)
            
            # Atualizar o y_offset para a próxima imagem
            y_offset -= img_height + 20  # 20px de espaço entre as imagens
            
            current_image += 1
    
    c.save()
    print(f"PDF criado com sucesso: {output_file}")

if __name__ == "__main__":
    # Configurar argparse para lidar com os parâmetros de linha de comando
    parser = argparse.ArgumentParser(description="Converter imagens de uma pasta para um arquivo PDF.")
    
    parser.add_argument("input_folder", type=str, help="Caminho para a pasta contendo as imagens.")
    parser.add_argument("output_file", type=str, help="Caminho para o arquivo PDF de saída.")
    
    args = parser.parse_args()
    
    # Chamar a função com os parâmetros fornecidos
    create_pdf_from_images(args.input_folder, args.output_file)

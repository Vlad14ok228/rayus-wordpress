import urllib.request
from PIL import Image
from collections import Counter
import io

try:
    req = urllib.request.Request('https://rayus.igroman.online/wp-content/uploads/2026/01/RAYUS_LOGO-removebg-preview.png', headers={'User-Agent': 'Mozilla/5.0'})
    img_data = urllib.request.urlopen(req).read()
    img = Image.open(io.BytesIO(img_data)).convert('RGBA')
    
    colors = []
    for count, (r, g, b, a) in img.getcolors(maxcolors=1000000):
        if a > 200 and not (r > 240 and g > 240 and b > 240) and not (r < 15 and g < 15 and b < 15):
            colors.append((count, (r, g, b)))
            
    colors.sort(reverse=True)
    if colors:
        r, g, b = colors[0][1]
        print(f"Dominant color: #{r:02x}{g:02x}{b:02x}")
    else:
        print("No dominant color found")
except Exception as e:
    print("Error:", e)

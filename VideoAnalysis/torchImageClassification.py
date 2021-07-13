import torchvision.models as models
from PIL import Image
from torchvision import transforms
import os
import torch
import pandas as pd
import sys


alexnet = models.alexnet(pretrained=True)
preprocess = transforms.Compose([
    transforms.Resize(256),
    transforms.CenterCrop(224),
    transforms.ToTensor(),
    transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225]),
])

# analyse image and return predicted concept
def runAnalysis(img_path):
    input_image = Image.open(img_path)
    input_tensor = preprocess(input_image)
    input_batch = input_tensor.unsqueeze(0) # create a mini-batch as expected by the model
    with torch.no_grad():
        output = alexnet(input_batch)
    return output.argmax(1).item()+1

# check parameter
if (len(sys.argv) < 2):
    print('This programm needs exactly one (image to be analyzed) argument')

path = ""
try:
    path = sys.argv[1]
except:
    print("error parsing program argument")
    exit(1)

if (os.path.exists(path)):
    print("parameter must be an existing folder of images or an existing image to be analyzed")

# iterate images in folder if input parameter is a folder
if (os.path.isdir(path)):
    for filename in os.listdir(path):
        if filename.endswith(".jpg") or filename.endswith(".png"):
            print(runAnalysis(path))
elif (path.endswith(".jpg") or path.endswith(".png")):
    print(runAnalysis(path))

exit(0)

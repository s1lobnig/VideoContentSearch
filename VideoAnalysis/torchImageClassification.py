import torchvision.models as models
from PIL import Image
from torchvision import transforms
import os
import torch
import pandas as pd
import sys
import psycopg2


# check parameter
if (len(sys.argv) != 6):
    print('This programm can be called: torchImageClassification.py <path> <host> <dbname> <username> <password>')
    exit(1)

path = ""
host = ""
dbname = ""
username = ""
password = ""
try:
    path = sys.argv[1]
    host = sys.argv[2]
    dbname = sys.argv[3]
    username = sys.argv[4]
    password = sys.argv[5]
except:
    print("error parsing program arguments")
    exit(1)

try:
    conn = psycopg2.connect(
        host=host,
        database=dbname,
        user=username,
        password=password
    )
    cur = conn.cursor()
except Exception as e:
    print("error connecting to db")
    exit(1)

net = models.resnet18(pretrained=True)
net.fc = torch.nn.Sequential(
    net.fc,
    torch.nn.Softmax(),
)

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
        output = net(input_batch)
    conceptid = output.argmax(1).item()
    confidence = output[0,conceptid].item()
    print(img_path)
    print(conceptid+1)
    print(confidence)
    #sql = '''Insert into keyframe (path, conceptid, confidence)
    #            values (%s, %s, %s)'''
    #cur.execute(sql, (img_path, conceptid+1, confidence))
    #conn.commit()

# iterate images in folder if input parameter is a folder
if (os.path.isdir(path)):
    for filename in os.listdir(path):
        if filename.endswith(".jpg") or filename.endswith(".png"):
            runAnalysis(path + filename)
elif (path.endswith(".jpg") or path.endswith(".png")):
    runAnalysis(path)

exit(0)

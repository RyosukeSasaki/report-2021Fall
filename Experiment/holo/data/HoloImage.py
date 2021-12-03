import numpy as np
import math as mt
import matplotlib.pyplot as plt

NumX = 400              # 計算する領域のX軸方向のメッシュ数
NumY = 300              # 計算する領域のY軸方向のメッシュ数
lamb = 632.8e-9         # レーザーの波長
dist = 0.2              # 物体から光源、目までの距離 [単位: m]
sizeX = 8e-2            # 物体のx軸方向の大きさ [単位: m]
sizeY = 6e-2            # 物体のy軸方向の大きさ [単位: m]
theta_source = mt.pi/4  # z軸に対する光源の位置に対する傾き [単位: radian]
deltaX = sizeX/NumX 
deltaY = sizeY/NumY

# 光源の位置ベクトル
v_source = np.array([dist*mt.sin(-theta_source), sizeY/2, dist*mt.cos(-theta_source)]) 
# 目の位置ベクトル
v_eye = np.array([0, sizeY/2, dist]) 
# 物体の位置ベクトルを定義
v_object = np.zeros(3) 
# 変位ベクトルを定義
v_d = np.zeros(3)
# 計算結果を保存する配列を定義
HoloImage = np.zeros((300, 400))

# 回転軸を選択
print('計算したい回転軸に対応する数値を入力してください')
print('0: z軸回転, 1: y軸回転')
while True:		# 0か1を入れるまでwhile文が回り続ける仕組み
  num = input()
  if num != '0' and num != '1': 
    print('入力した値が間違えています。"0"か"1"を入力して下さい。')
  if num == '0' or num == '1':
    break
num = int(num)

# 回転角を入力
print('回転角度を入力してください (単位はラジアン)')
theta = input()
theta = float(theta)

### 計算を実行
for i in range(NumX):
  v_object[0] = deltaX*(i-NumX/2)
  for j in range(NumY):
    v_object[1] = deltaY*j
    if num == 0: # z軸回転
      v_d[0] = -theta*v_object[1]
      v_d[1] = theta*v_object[0] 
      v_d[2] = 0
    elif num == 1: # y軸回転
      v_d[0] = theta*v_object[2]
      v_d[1] = 0 
      v_d[2] = -theta*v_object[0]
    v_e0 = (v_object-v_source)/np.linalg.norm(v_object-v_source)  # 光源から物体に向かう単位ベクトルを計算
    v_e1 = (v_eye-v_object)/np.linalg.norm(v_eye-v_object)        # 物体から目に向かう単位ベクトルを計算
    dphase = (2*mt.pi/lamb)*np.dot(v_d, (v_e1-v_e0))              # 回転前後の光路差の変化から位相差を計算
    HoloImage[j][i] = (1+mt.cos(dphase))/2

# 計算結果を出力
plt.figure(dpi=200)
plt.xlabel('x [mm]'); plt.ylabel('y [mm]')
plt.rcParams["font.size"] = 12
plt.imshow(HoloImage, cmap = 'gray', vmin = 0, vmax = 1, origin='lower', extent=[-40,40,0,60])
plt.show()

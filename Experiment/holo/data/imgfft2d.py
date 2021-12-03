#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from math import pi
import skimage
from PIL import Image
from PIL import ImageDraw
import numpy as np
from matplotlib import pyplot as plt


def main():
    # 画像を読み込む
    img = Image.open('free4_trim.png')
    # グレイスケールに変換する
    gray_img = img.convert('L')
    # NumPy 配列にする
    f_xy = np.asarray(gray_img)

    # 2 次元高速フーリエ変換で周波数領域の情報を取り出す
    f_uv = np.fft.fft2(f_xy)
    # 画像の中心に低周波数の成分がくるように並べかえる
    shifted_f_uv = np.fft.fftshift(f_uv)

    # フィルタ (ローパス) を用意する
    x_pass_filter = Image.new(mode='L',  # 8-bit pixels, black and white
                              size=(shifted_f_uv.shape[1],
                                    shifted_f_uv.shape[0]),
                              color=0,  # default black
                              )
    # 中心に円を描く
    draw = ImageDraw.Draw(x_pass_filter)
    # 円の半径
    ellipse_r = 30
    # 画像の中心
    center = (shifted_f_uv.shape[1] // 2,
              shifted_f_uv.shape[0] // 2)
    # 円の座標
    ellipse_pos = (center[0] - ellipse_r,
                   center[1] - ellipse_r,
                   center[0] + ellipse_r,
                   center[1] + ellipse_r)
    draw.ellipse(ellipse_pos, fill=255)
    # フィルタ
    filter_array = np.asarray(x_pass_filter)

    # フィルタを適用する
    filtered_f_uv = np.multiply(shifted_f_uv, filter_array)

    # パワースペクトルに変換する
    magnitude_spectrum2d = 20 * np.log(np.absolute(filtered_f_uv))

    # 元の並びに直す
    unshifted_f_uv = np.fft.fftshift(filtered_f_uv)
    # 2 次元逆高速フーリエ変換で空間領域の情報に戻す
    i_f_xy_complex = np.fft.ifft2(unshifted_f_uv)
    i_f_xy = abs(i_f_xy_complex)
    f_xy_complex = np.fft.ifft2(i_f_xy)
    i_f_phase = np.angle(f_xy_complex)
    #i_f_phase = np.unwrap(i_f_phase, period=pi*0.8, axis=0)
    #i_f_phase = np.unwrap(i_f_phase, period=pi*0.8, axis=1)
    i_f_phase = skimage.restoration.unwrap_phase(i_f_phase)
    #i_f_phase = abs(i_f_phase)

    x = np.array([x for x in range(shifted_f_uv.shape[1])])
    y = np.array([x for x in range(shifted_f_uv.shape[0])])
    X, Y = np.meshgrid(x,y)

    fig = plt.figure(figsize = (8, 8))
    ax = fig.add_subplot(111, projection="3d")
    ax.set_xlabel("x")
    ax.set_ylabel("y")
    ax.set_zlabel("Phase Shift")
    #ax.contour3D(X,Y,i_f_phase,rstride=10,cstride=50)
    ax.plot_wireframe(X,Y,i_f_phase,rstride=10,cstride=50)
    plt.show()

    fig, axes = plt.subplots(1, 2, figsize=(12, 12))
    for ax in axes:
        #for ax in axe:
            for spine in ax.spines.values():
                spine.set_visible(False)
            ax.set_xticks([])
            ax.set_yticks([])
    # 元画像
    #axes[0,0].imshow(f_xy, cmap='gray')
    #axes[0,0].set_title('Input Image')
    ## フィルタ画像
    #axes[0,1].imshow(filter_array, cmap='gray')
    #axes[0,1].set_title('Filter Image')
    # フィルタされた周波数領域のパワースペクトル
    #axes[0,1].imshow(magnitude_spectrum2d, cmap='gray')
    #axes[0,1].set_title('Filtered Magnitude Spectrum')
    # FFT -> Band-pass Filter -> IFFT した画像
    axes[0].imshow(i_f_xy, cmap='gray')
    axes[0].set_title('Filtered Image')
    # FFT -> Band-pass Filter -> IFFT した画像
    axes[1].imshow(i_f_phase, cmap='gray')
    axes[1].set_title('Phase Image')
    # グラフを表示する
    plt.show()

if __name__ == '__main__':
    main()
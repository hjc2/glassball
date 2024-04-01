

import numpy as np


def cross_product(v1, v2):
    return np.cross(v1, v2)

def vector_from_points(p1, p2):
    return np.array(p2) - np.array(p1)

def surface_normal(p1, p2, p3):
    v1 = vector_from_points(p1, p2)
    v2 = vector_from_points(p1, p3)
    normal = cross_product(v1, v2)
    # Normalize the normal vector
    norm = np.linalg.norm(normal)
    if norm == 0:
       return normal
    return normal / norm

def normalize(v):
    norm = (v[0] ** 2 + v[1] ** 2 + v[2] ** 2) ** 0.5
    return (v[0] / norm, v[1] / norm, v[2] / norm)


A = np.array([50,20,20])
B = np.array([85, 120, 0])
C = np.array([60,200,80])
D = np.array([-20, 150,60])

normal_ADC = surface_normal(A, D, C)
normal_ABC = surface_normal(A, B, C)
normal_CBD = surface_normal(C, B, D)
normal_BCD = surface_normal(B, C, D)

print(normal_ADC)
print(normal_ABC)
print(normal_CBD)
print(normal_BCD)

gourardNormalA
gourardNormalB
gourardNormalC
gourardNormalD
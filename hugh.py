import numpy as np

def cross_product(v1, v2):
    return np.cross(v1, v2)

def normalize(v):
    norm = np.linalg.norm(v)
    return v / norm

def calculate_surface_normal(p1, p2, p3):
    vec1 = np.array(p2) - np.array(p1)
    vec2 = np.array(p3) - np.array(p1)
    cp = cross_product(vec1, vec2)
    normal = normalize(cp)
    return normal

# Points for vertices A, B, C, and D
A = np.array([50, 20, 20])
B = np.array([85, 120, 0])
C = np.array([60, 200, 80])
D = np.array([-20, 150, 60])

# Calculate the normals for the surfaces
normal_ABC = calculate_surface_normal(A, B, C)
normal_ACD = calculate_surface_normal(A, C, D)
normal_ADB = calculate_surface_normal(A, D, B)
normal_BDC = calculate_surface_normal(B, D, C)

print("Calculated surface normals:")
print(f"- Surface ABC's normal: {normal_ABC}")
print(f"- Surface ACD's normal: {normal_ACD}")
print(f"- Surface ADB's normal: {normal_ADB}")
print(f"- Surface BDC's normal: {normal_BDC}")

def add_divide_vectors(v1, v2, v3):
    return (v1 + v2 + v3) / 3

# Calculate the Gouraud normal for each vertex 
GouraudNormalA = normalize(add_divide_vectors(normal_ABC, normal_ACD, normal_ADB))
GouraudNormalB = normalize(add_divide_vectors(normal_ABC, normal_BDC, normal_ADB))
GouraudNormalC = normalize(add_divide_vectors(normal_ABC, normal_ACD, normal_BDC))
GouraudNormalD = normalize(add_divide_vectors(normal_ACD, normal_ADB, normal_BDC))

print("\nGouraud shading normals for vertices:")
print(f"- Vertex A: {GouraudNormalA}")
print(f"- Vertex B: {GouraudNormalB}")
print(f"- Vertex C: {GouraudNormalC}")
print(f"- Vertex D: {GouraudNormalD}")

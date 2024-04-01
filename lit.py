def cross_product(v1, v2):
    return (v1[1]*v2[2] - v1[2]*v2[1], v1[2]*v2[0] - v1[0]*v2[2], v1[0]*v2[1] - v1[1]*v2[0])

def normalize(v):
    # The reason why we normalize is to keep everything consistent. 
    # If we have a normal that is not normalized, the length of the normal will affect the lighting calculations.
    # We want to keep the normal consistent so that the lighting calculations are consistent.
    # Joses meat is pretty girthy
    norm = (v[0]**2 + v[1]**2 + v[2]**2)**0.5
    return (v[0]/norm, v[1]/norm, v[2]/norm)

def calculate_surface_normal(p1, p2, p3):
    # Create vectors from points
    vec1 = (p2[0] - p1[0], p2[1] - p1[1], p2[2] - p1[2])
    vec2 = (p3[0] - p1[0], p3[1] - p1[1], p3[2] - p1[2])

    # Calculate the cross product of the vectors
    cp = cross_product(vec1, vec2)

    # Normalize the cross product to get the surface normal
    normal = normalize(cp)
    
    return normal


# Points for vertices A, B, and C
A = (50, 20, 20)
B = (85, 120, 0)
C = (60, 200, 80)
D = (-20, 150, 60)

# Calculate the normal for the surface ABC
normal_ABC = calculate_surface_normal(A, B, C)
normal_ACD = calculate_surface_normal(A, C, D)
normal_ADB = calculate_surface_normal(A, D, B)
normal_BDC = calculate_surface_normal(B, D, C)

print(f"The normal for the surface ABC is: {normal_ABC}")
print(f"The normal for the surface ACD is: {normal_ACD}")
print(f"The normal for the surface ADB is: {normal_ADB}")
print(f"The normal for the surface BDC is: {normal_BDC}")

def add_vectors(v1, v2, v3):
    return (v1[0] + v2[0] + v3[0], v1[1] + v2[1] + v3[1], v1[2] + v2[2] + v3[2])

def add_Divide_Vectors(v1, v2, v3):
    return (v1[0] + v2[0] + v3[0], v1[1] + v2[1] + v3[1], v1[2] + v2[2] + v3[2])

# Calculate the Gourard normal for each vertex 
GourardNormalA = normalize(add_Divide_Vectors(normal_ABC, normal_ACD, normal_ADB))
GourardNormalB = normalize(add_Divide_Vectors(normal_ABC, normal_BDC, normal_ADB))
GourardNormalC = normalize(add_Divide_Vectors(normal_ABC, normal_ACD, normal_BDC))
GourardNormalD = normalize(add_Divide_Vectors(normal_ACD, normal_ADB, normal_BDC))


print(f"The Gourard normal for vertex A is: {GourardNormalA}")
print(f"The Gourard normal for vertex B is: {GourardNormalB}")
print(f"The Gourard normal for vertex C is: {GourardNormalC}")
print(f"The Gourard normal for vertex D is: {GourardNormalD}")
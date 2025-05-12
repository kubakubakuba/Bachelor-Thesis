import pandas as pd

df = pd.read_csv('pnp_results.csv')

average_distance_error = df['distance_error'].mean()

std_distance_error = df['distance_error'].std()

print("Average Distance Error:", average_distance_error)
print("Standard Deviation of Distance Error:", std_distance_error)

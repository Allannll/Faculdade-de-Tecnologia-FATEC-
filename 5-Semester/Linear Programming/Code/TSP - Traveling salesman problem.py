pip install gurobipy
from google.colab import drive
drive.mount('/content/drive')

import gurobipy as gp
from gurobipy import GRB
import math
import time

# =========================
# Letter A — Minimize Total Tardiness
# =========================
def solve_A(coords, service, deadline):
    start = time.time()  # start timestamp

    n = len(coords)
    # Build Euclidean distance matrix between each pair of nodes
    D = [[0.0]*n for _ in range(n)]
    for i in range(n):
        xi, yi = coords[i]
        for j in range(n):
            if i != j:
                xj, yj = coords[j]
                D[i][j] = math.sqrt((xi - xj)**2 + (yi - yj)**2)

    # Print distance matrix
    def print_matrix(D):
        n = len(D)
        print("\nDistance matrix letter A:")
        header = "     " + " ".join([f"{j:8d}" for j in range(n)])
        print(header)
        for i in range(n):
            row = f"{i:3d} " + " ".join([f"{D[i][j]:8.2f}" for j in range(n)])
            print(row)

    print_matrix(D)

    # Optimization model
    model = gp.Model("TSP_Base")
    model.Params.OutputFlag = 0
    model.Params.LogToConsole = 0
    model.Params.TimeLimit = 1800   # 30-minute time limit

    # Decision variables
    x = model.addVars(n, n, vtype=GRB.BINARY, name="x")
    t = model.addVars(n, vtype=GRB.CONTINUOUS, name="t")
    L = model.addVars(range(1, n), vtype=GRB.CONTINUOUS, lb=0.0, name="L")
    M = 1e5

    # Degree constraints (each node has one arrival and one departure)
    for i in range(n):
        model.addConstr(x[i, i] == 0)
        model.addConstr(gp.quicksum(x[i, j] for j in range(n) if j != i) == 1)
        model.addConstr(gp.quicksum(x[j, i] for j in range(n) if j != i) == 1)
    model.addConstr(t[0] == 0)

    # Time propagation using Big-M
    for i in range(n):
        for j in range(n):
            if i != j and j != 0:
                model.addConstr(t[j] >= t[i] + service[i] + D[i][j] - M*(1 - x[i, j]))

    # Tardiness definition: L[i] >= t[i] - deadline[i]
    for i in range(1, n):
        model.addConstr(L[i] >= t[i] - deadline[i])

    # Objective: minimize total tardiness
    model.setObjective(gp.quicksum(L[i] for i in range(1, n)), GRB.MINIMIZE)
    model.optimize()

    # Reconstruct route from x[i,j]
    def reconstruct():
        route = [0]
        current = 0
        visited = {0}
        while True:
            nxt = None
            for j in range(n):
                if j != current and x[current, j].X > 0.5:
                    nxt = j
                    break
            if nxt is None: break
            route.append(nxt)
            if nxt == 0: break
            if nxt in visited: break
            visited.add(nxt)
            current = nxt
        return route

    end = time.time()  # end timestamp

    # Results output
    if model.Status in (GRB.OPTIMAL, GRB.TIME_LIMIT):
        route = reconstruct()
        value = model.ObjVal
        tardiness = {i: L[i].X for i in range(1, n)}
        max_tardiness = max(tardiness.values()) if tardiness else 0.0

        print("\n=== Letter A ===")
        print("Route:", " → ".join(map(str, route)))
        print("Arrival times t[i]:", [t[i].X for i in range(n)])
        print("Tardiness L[i]:", tardiness)
        print(f"Value (total tardiness): {value:.2f}")
        print(f"Max individual tardiness: {max_tardiness:.2f}")
        print(f"Execution time: {end - start:.2f} seconds")
        print(f"GAP: {model.MIPGap:.4f}")
    else:
        print("\n=== Letter A ===\nInfeasible.")

    return model


# =========================
# Letter B — Minimize Maximum Tardiness
# =========================
def solve_B(coords, service, deadline):
    start = time.time()  # start timestamp

    n = len(coords)
    # Build Euclidean distance matrix between each pair of nodes
    D = [[0.0]*n for _ in range(n)]
    for i in range(n):
        xi, yi = coords[i]
        for j in range(n):
            if i != j:
                xj, yj = coords[j]
                D[i][j] = math.sqrt((xi - xj)**2 + (yi - yj)**2)

    # Print distance matrix
    def print_matrix(D):
        n = len(D)
        print("\nDistance matrix letter B:")
        header = "     " + " ".join([f"{j:8d}" for j in range(n)])
        print(header)
        for i in range(n):
            row = f"{i:3d} " + " ".join([f"{D[i][j]:8.2f}" for j in range(n)])
            print(row)

    print_matrix(D)

    # Optimization model
    model = gp.Model("TSP_Base")
    model.Params.OutputFlag = 0
    model.Params.LogToConsole = 0
    model.Params.TimeLimit = 1800   # 30-minute time limit

    # Decision variables
    x = model.addVars(n, n, vtype=GRB.BINARY, name="x")
    t = model.addVars(n, vtype=GRB.CONTINUOUS, name="t")
    L = model.addVars(range(1, n), vtype=GRB.CONTINUOUS, lb=0.0, name="L")
    M = 1e5
    Tmax = model.addVar(vtype=GRB.CONTINUOUS, lb=0.0, name="Tmax")  # max tardiness

    # Degree constraints
    for i in range(n):
        model.addConstr(x[i, i] == 0)
        model.addConstr(gp.quicksum(x[i, j] for j in range(n) if j != i) == 1)
        model.addConstr(gp.quicksum(x[j, i] for j in range(n) if j != i) == 1)
    model.addConstr(t[0] == 0)

    # Time propagation with Big-M
    for i in range(n):
        for j in range(n):
            if i != j and j != 0:
                model.addConstr(t[j] >= t[i] + service[i] + D[i][j] - M*(1 - x[i, j]))

    # Tardiness definition
    for i in range(1, n):
        model.addConstr(L[i] >= t[i] - deadline[i])

    # Maximum tardiness constraint
    for i in range(1, n):
        model.addConstr(Tmax >= L[i])

    # Objective: minimize max tardiness
    model.setObjective(Tmax, GRB.MINIMIZE)
    model.optimize()

    # Reconstruct route
    def reconstruct():
        route = [0]
        current = 0
        visited = {0}
        while True:
            nxt = None
            for j in range(n):
                if j != current and x[current, j].X > 0.5:
                    nxt = j
                    break
            if nxt is None: break
            route.append(nxt)
            if nxt == 0: break
            if nxt in visited: break
            visited.add(nxt)
            current = nxt
        return route

    end = time.time()

    # Results output
    if model.Status in (GRB.OPTIMAL, GRB.TIME_LIMIT):
        route = reconstruct()
        tardiness_real = {i: t[i].X - deadline[i] for i in range(1, n)}
        total_pos_tardiness = sum(v for v in tardiness_real.values() if v > 0)

        print("\n=== Letter B ===")
        print("Route:", " → ".join(map(str, route)))
        print("Arrival times t[i]:", [t[i].X for i in range(n)])
        print("Real tardiness t[i]-deadline[i]:", tardiness_real)
        print(f"Value (max tardiness): {Tmax.X:.2f}")
        print(f"Sum of tardiness: {total_pos_tardiness:.2f}")
        print(f"Execution time: {end - start:.2f} seconds")
        print(f"GAP: {model.MIPGap:.4f}")
    else:
        print("\n=== Letter B ===\nInfeasible.")

    return model
using Test
import Ecophys
import Unitful: K, J, K, mol
import Unitful
PH = Ecophys.Photosynthesis

# Constants used in components
@test PH.GasConstant(Float64) == 8.314
@test PH.GasConstant(Float32) == 8.314f0
@test PH.GasConstant(Unitful.Quantity) == 8.314J/K/mol
@test PH.BaseTemp(Float64) == 298.15
@test PH.BaseTemp(Float32) == 298.15f0
@test PH.BaseTemp(Unitful.Quantity) == 298.15K

# Arrhenius temperature response
@test PH.arrhenius(1.0, 65330.0, 298.15) == 1.0
@test PH.arrhenius(1.0, 65330.0J/mol, 298.15K) == 1.0
@test PH.arrhenius(1.0mol, 65330.0J/mol, 298.15K) == 1.0mol
@test PH.arrhenius(1.0, 65330.0, 298.15 + 10.0) ≈ 2.3520205168012107
@test PH.arrhenius(1.0, 65330.0, 298.15 - 10.0) ≈ 0.40066167345438386

# Peaked temperature response with optimum temperature
@test PH.peaked(1.0, 26900.0, 2e5, 298.15, 298.15) == 1.0
@test PH.peaked(1.0, 26900.0J/mol, 2e5J/mol, 298.15K, 298.15K) == 1.0
@test PH.peaked(1.0mol, 26900.0J/mol, 2e5J/mol, 298.15K, 298.15K) == 1.0mol
@test PH.peaked(1.0, 26900.0, 2e5, 298.15, 298.15 + 10.0) ≈ 0.524803439463303
@test PH.peaked(1.0, 26900.0, 2e5, 298.15, 298.15 - 10.0) ≈ 0.785398095155038

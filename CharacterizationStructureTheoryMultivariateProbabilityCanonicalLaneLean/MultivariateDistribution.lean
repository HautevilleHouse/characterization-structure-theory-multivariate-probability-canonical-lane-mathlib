import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean

structure MultivariateDistributionPackage where
  dimension : ℕ
  randomVector : ℝ^dimension
  probabilityMeasure : MeasureTheory.Measure (ℝ^dimension)
  density : ℝ^dimension → ℝ≥0
  densityIntegratesToOne : ∫ x in ℝ^dimension, density x ∂volume = 1
  measurable : Measurable density

structure MultivariateDistributionEvidence (D : MultivariateDistributionPackage) where
  densityIntegratesToOneClosed : D.densityIntegratesToOne
  measurableClosed : D.measurable

def MultivariateDistributionClosed (D : MultivariateDistributionPackage) : Prop :=
  D.densityIntegratesToOne ∧ D.measurable

theorem multivariate_distribution_closed_from_evidence (D : MultivariateDistributionPackage) (E : MultivariateDistributionEvidence D) : MultivariateDistributionClosed D := by
  exact And.intro E.densityIntegratesToOneClosed E.measurableClosed

structure CharacterizationTheorem (D : MultivariateDistributionPackage) where
  characteristicFunction : ℝ^dimension → ℂ
  uniqueness : ∀ (μ ν : MeasureTheory.Measure (ℝ^dimension)), (∀ t, characteristicFunction t = ∫ x, exp(i * t · x) ∂μ x) ∧ (∫ x, exp(i * t · x) ∂μ x = ∫ x, exp(i * t · x) ∂ν x) → μ = ν
  continuity : Continuous characteristicFunction
  characterizationClosed : Prop

def CharacterizationTheoremClosed (D : MultivariateDistributionPackage) (C : CharacterizationTheorem D) : Prop :=
  C.characterizationClosed

theorem characterization_theorem_closed (D : MultivariateDistributionPackage) (C : CharacterizationTheorem D) : CharacterizationTheoremClosed D C := by
  exact C.characterizationClosed

end CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean
end HautevilleHouse
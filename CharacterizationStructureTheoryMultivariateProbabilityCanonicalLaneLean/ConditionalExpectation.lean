import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean

structure ConditionalExpectationPackage where
  Ω : Type u
  ℱ : MeasureTheory.SubSigmaAlgebra Ω
  X : Ω → ℝ
  integrableX : MeasureTheory.Integrable X
  conditionalExpectation : Ω → ℝ
  ℱMeasurable : MeasureTheory.StronglyMeasurable conditionalExpectation ℱ
  definingProperty : ∀ A ∈ ℱ, ∫ ω in A, X ω ∂μ = ∫ ω in A, conditionalExpectation ω ∂μ

structure ConditionalExpectationEvidence (CE : ConditionalExpectationPackage) where
  integrableXClosed : CE.integrableX
  ℱMeasurableClosed : CE.ℱMeasurable
  definingPropertyClosed : ∀ A ∈ CE.ℱ, ∫ ω in A, CE.X ω ∂μ = ∫ ω in A, CE.conditionalExpectation ω ∂μ

def ConditionalExpectationClosed (CE : ConditionalExpectationPackage) : Prop :=
  CE.integrableX ∧ CE.ℱMeasurable ∧ (∀ A ∈ CE.ℱ, ∫ ω in A, CE.X ω ∂μ = ∫ ω in A, CE.conditionalExpectation ω ∂μ)

theorem conditional_expectation_closed_from_evidence (CE : ConditionalExpectationPackage) (E : ConditionalExpectationEvidence CE) : ConditionalExpectationClosed CE := by
  exact And.intro E.integrableXClosed (And.intro E.ℱMeasurableClosed E.definingPropertyClosed)

structure DoobMeyerDecomposition (CE : ConditionalExpectationPackage) where
  submartingale : ℕ → (Ω → ℝ)
  DoobDecomposition : ∃ (martingale : ℕ → (Ω → ℝ)) (predictable : ℕ → (Ω → ℝ)), (∀ n, submartingale n = martingale n + predictable n) ∧ (∀ n, MeasureTheory.Integrable (martingale n)) ∧ (∀ n, MeasureTheory.Integrable (predictable n))
  decompositionClosed : Prop

def DoobMeyerDecompositionClosed (CE : ConditionalExpectationPackage) (D : DoobMeyerDecomposition CE) : Prop :=
  D.decompositionClosed

theorem doob_meyer_decomposition_closed (CE : ConditionalExpectationPackage) (D : DoobMeyerDecomposition CE) : DoobMeyerDecompositionClosed CE D := by
  exact D.decompositionClosed

end CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean
end HautevilleHouse
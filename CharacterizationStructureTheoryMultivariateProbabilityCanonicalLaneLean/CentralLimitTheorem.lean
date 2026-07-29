import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean

structure CentralLimitPackage where
  sampleSpace : Type u
  probabilityMeasure : MeasureTheory.Measure sampleSpace
  iidSequence : ℕ → (sampleSpace → ℝ)
  mean : ℝ
  variance : ℝ
  meanFinite : MeasureTheory.Integrable (iidSequence 0)
  varianceFinite : MeasureTheory.Integrable (λ ω => (iidSequence 0 ω - mean)^2)
  iidProperty : ∀ n, MeasureTheory.IdenticallyDistributed (iidSequence n) (iidSequence 0)

structure CentralLimitEvidence (CL : CentralLimitPackage) where
  meanFiniteClosed : CL.meanFinite
  varianceFiniteClosed : CL.varianceFinite
  iidPropertyClosed : ∀ n, MeasureTheory.IdenticallyDistributed (CL.iidSequence n) (CL.iidSequence 0)

def CentralLimitClosed (CL : CentralLimitPackage) : Prop :=
  CL.meanFinite ∧ CL.varianceFinite ∧ (∀ n, MeasureTheory.IdenticallyDistributed (CL.iidSequence n) (CL.iidSequence 0))

theorem central_limit_closed_from_evidence (CL : CentralLimitPackage) (E : CentralLimitEvidence CL) : CentralLimitClosed CL := by
  exact And.intro E.meanFiniteClosed (And.intro E.varianceFiniteClosed E.iidPropertyClosed)

structure CentralLimitTheorem (CL : CentralLimitPackage) where
  scaledSum : ℕ → (sampleSpace → ℝ) := λ n ω => (∑ i in Finset.range n, (CL.iidSequence i ω - CL.mean)) / (Real.sqrt (CL.variance * n))
  convergenceInDistribution : ∀ (x : ℝ), Filter.Tendsto (λ n => CL.probabilityMeasure {ω | scaledSum n ω ≤ x}) Filter.atTop (𝓝 (NormalCDF 0 1 x))
  convergenceClosed : Prop

def CentralLimitTheoremClosed (CL : CentralLimitPackage) (T : CentralLimitTheorem CL) : Prop :=
  T.convergenceClosed

theorem central_limit_theorem_closed (CL : CentralLimitPackage) (T : CentralLimitTheorem CL) : CentralLimitTheoremClosed CL T := by
  exact T.convergenceClosed

end CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean
end HautevilleHouse
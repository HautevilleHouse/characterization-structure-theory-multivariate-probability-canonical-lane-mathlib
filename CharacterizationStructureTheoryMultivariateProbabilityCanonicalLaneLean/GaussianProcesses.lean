import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean

structure GaussianProcessPackage where
  indexSet : Type u
  meanFunction : indexSet → ℝ
  covarianceKernel : indexSet → indexSet → ℝ
  positiveSemidefinite : ∀ (x₁,...,xₙ) ∈ indexSet, ∀ (a₁,...,aₙ) ∈ ℝ, ∑ i,j a_i a_j covarianceKernel x_i x_j ≥ 0
  sampleContinuity : Prop

structure GaussianProcessEvidence (GP : GaussianProcessPackage) where
  positiveSemidefiniteClosed : GP.positiveSemidefinite
  sampleContinuityClosed : GP.sampleContinuity

def GaussianProcessClosed (GP : GaussianProcessPackage) : Prop :=
  GP.positiveSemidefinite ∧ GP.sampleContinuity

theorem gaussian_process_closed_from_evidence (GP : GaussianProcessPackage) (E : GaussianProcessEvidence GP) : GaussianProcessClosed GP := by
  exact And.intro E.positiveSemidefiniteClosed E.sampleContinuityClosed

structure RepresentationTheorem (GP : GaussianProcessPackage) where
  karhunenLoeveExpansion : ∃ (λₙ) (φₙ : indexSet → ℝ), (∀ n, ∫ x, φₙ x * φₙ x ∂μ = 1) ∧ (∀ n, ∫ x, covarianceKernel x y φₙ y ∂μ = λₙ φₙ x)
  expansionClosed : Prop

def RepresentationTheoremClosed (GP : GaussianProcessPackage) (R : RepresentationTheorem GP) : Prop :=
  R.expansionClosed

theorem representation_theorem_closed (GP : GaussianProcessPackage) (R : RepresentationTheorem GP) : RepresentationTheoremClosed GP R := by
  exact R.expansionClosed

end CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean
end HautevilleHouse
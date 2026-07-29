import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean

structure MartingaleConvergencePackage where
  filtration : Type u
  adaptedProcess : Type v
  integrabilityCondition : Prop
  convergenceAlmostSurely : Prop
  squareIntegrableCase : Prop

structure MartingaleConvergenceEvidence (M : MartingaleConvergencePackage) where
  integrabilityConditionClosed : M.integrabilityCondition
  convergenceAlmostSurelyClosed : M.convergenceAlmostSurely
  squareIntegrableCaseClosed : M.squareIntegrableCase

def MartingaleConvergenceClosed (M : MartingaleConvergencePackage) : Prop :=
  M.integrabilityCondition ∧ M.convergenceAlmostSurely ∧ M.squareIntegrableCase

theorem martingale_convergence_closed_from_evidence
    (M : MartingaleConvergencePackage) (E : MartingaleConvergenceEvidence M) :
    MartingaleConvergenceClosed M := by
  exact And.intro E.integrabilityConditionClosed
    (And.intro E.convergenceAlmostSurelyClosed E.squareIntegrableCaseClosed)

end CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean
end HautevilleHouse

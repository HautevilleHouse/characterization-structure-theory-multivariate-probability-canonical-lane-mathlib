import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean

structure MultivariateCharacterizationPackage (A : AdmissibleClass) where
  copulaStructure : Prop
  sklarTheorem : Prop
  characteristicFunction : Prop
  cramerWoldDevice : Prop
  multivariateCentralLimit : Prop

structure MultivariateCharacterizationEvidence {A : AdmissibleClass} (M : MultivariateCharacterizationPackage A) where
  copulaStructureClosed : M.copulaStructure
  sklarTheoremClosed : M.sklarTheorem
  characteristicFunctionClosed : M.characteristicFunction
  cramerWoldDeviceClosed : M.cramerWoldDevice
  multivariateCentralLimitClosed : M.multivariateCentralLimit

def MultivariateCharacterizationClosed {A : AdmissibleClass} (M : MultivariateCharacterizationPackage A) : Prop :=
  M.copulaStructure ∧ M.sklarTheorem ∧ M.characteristicFunction ∧ M.cramerWoldDevice ∧ M.multivariateCentralLimit

theorem multivariate_characterization_closed_from_evidence {A : AdmissibleClass}
    (M : MultivariateCharacterizationPackage A) (E : MultivariateCharacterizationEvidence M) :
    MultivariateCharacterizationClosed M := by
  exact And.intro E.copulaStructureClosed
    (And.intro E.sklarTheoremClosed
      (And.intro E.characteristicFunctionClosed
        (And.intro E.cramerWoldDeviceClosed E.multivariateCentralLimitClosed)))

end CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean
end HautevilleHouse
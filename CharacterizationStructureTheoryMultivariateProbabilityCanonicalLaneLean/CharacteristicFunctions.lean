import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean

structure CharacteristicFunctionsPackage where
  distribution : Type u
  characteristicFunction : Type v
  inversionFormula : Prop
  uniquenessTheorem : Prop
  continuityTheorem : Prop

structure CharacteristicFunctionsEvidence (C : CharacteristicFunctionsPackage) where
  distributionClosed : C.distribution
  characteristicFunctionClosed : C.characteristicFunction
  inversionFormulaClosed : C.inversionFormula
  uniquenessTheoremClosed : C.uniquenessTheorem
  continuityTheoremClosed : C.continuityTheorem

def CharacteristicFunctionsClosed (C : CharacteristicFunctionsPackage) : Prop :=
  C.distribution ∧ C.characteristicFunction ∧ C.inversionFormula ∧ C.uniquenessTheorem ∧ C.continuityTheorem

theorem characteristic_functions_closed_from_evidence (C : CharacteristicFunctionsPackage) (E : CharacteristicFunctionsEvidence C) : CharacteristicFunctionsClosed C :=
  And.intro E.distributionClosed (And.intro E.characteristicFunctionClosed (And.intro E.inversionFormulaClosed (And.intro E.uniquenessTheoremClosed E.continuityTheoremClosed)))

end CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean
end HautevilleHouse
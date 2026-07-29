import canonicalLaneMathlib.AdmissibleClass
import CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean

def ConstrainedCharacterizationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_characterization_endgame (A : AdmissibleClass) :
    ConstrainedCharacterizationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean
end HautevilleHouse

import CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean

structure AdmissibleClass where
  object : ProbabilityAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ProbabilityWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean

structure ProbabilityAdmittedObject where
  probSpace : Type u
  sigmaAlgebra : Set (Set probSpace)
  probabilityMeasure : probSpace → ℝ
  dominatesProductMeasure : Prop
  conclusion : dominatesProductMeasure

structure AdmissibleClass where
  object : ProbabilityAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def ProbabilityWitnessClosed (O : ProbabilityAdmittedObject) : Prop :=
  O.dominatesProductMeasure

def admittedClosure (A : AdmissibleClass) : Prop :=
  ProbabilityWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean
end HautevilleHouse
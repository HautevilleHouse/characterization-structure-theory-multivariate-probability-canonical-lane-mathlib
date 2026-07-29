import CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean.LimitTheorems

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean

structure CharacterizationStructurePackage (A : AdmissibleClass) where
  multivariateDistribution : Prop
  conditionalIndependence : Prop
  graphicalModel : Prop
  markovProperties : Prop

def CharacterizationStructureClosed (A : AdmissibleClass) : Prop :=
  A.object.convergenceProperty ∧ A.object.martingaleConvergence

theorem characterization_structure_from_limit (A : AdmissibleClass) (E : LimitTheoremEvidence A) :
    CharacterizationStructureClosed A := by
  exact And.intro A.object.convergenceProperty A.object.martingaleConvergence

end CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean
end HautevilleHouse
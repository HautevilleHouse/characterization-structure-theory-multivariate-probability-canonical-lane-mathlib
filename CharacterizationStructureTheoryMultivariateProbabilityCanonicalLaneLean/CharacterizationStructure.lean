import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean

structure CharacterizationStructurePackage where
  targetSpace : Type u
  sourceSpace : Type v
  measurableStructure : Prop
  factorizationProperty : Prop
  conditionalIndependenceStructure : Prop

structure CharacterizationStructureEvidence (C : CharacterizationStructurePackage) where
  measurableStructureClosed : C.measurableStructure
  factorizationPropertyClosed : C.factorizationProperty
  conditionalIndependenceStructureClosed : C.conditionalIndependenceStructure

def CharacterizationStructureClosed (C : CharacterizationStructurePackage) : Prop :=
  C.measurableStructure ∧ C.factorizationProperty ∧ C.conditionalIndependenceStructure

theorem characterization_structure_closed_from_evidence
    (C : CharacterizationStructurePackage) (E : CharacterizationStructureEvidence C) :
    CharacterizationStructureClosed C := by
  exact And.intro E.measurableStructureClosed
    (And.intro E.factorizationPropertyClosed E.conditionalIndependenceStructureClosed)

end CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean
end HautevilleHouse

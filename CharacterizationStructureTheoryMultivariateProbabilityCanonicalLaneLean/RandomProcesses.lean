import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean

structure RandomProcessesPackage where
  stationaryProcess : Type u
  ergodicProperties : Prop
  mixingConditions : Prop
  spectralRepresentation : Prop
  predictionTheory : Prop

structure RandomProcessesEvidence (R : RandomProcessesPackage) where
  stationaryProcessClosed : R.stationaryProcess
  ergodicPropertiesClosed : R.ergodicProperties
  mixingConditionsClosed : R.mixingConditions
  spectralRepresentationClosed : R.spectralRepresentation
  predictionTheoryClosed : R.predictionTheory

def RandomProcessesClosed (R : RandomProcessesPackage) : Prop :=
  R.stationaryProcess ∧ R.ergodicProperties ∧ R.mixingConditions ∧ R.spectralRepresentation ∧ R.predictionTheory

theorem random_processes_closed_from_evidence (R : RandomProcessesPackage) (E : RandomProcessesEvidence R) : RandomProcessesClosed R :=
  And.intro R.stationaryProcess (And.intro E.ergodicPropertiesClosed (And.intro E.mixingConditionsClosed (And.intro E.spectralRepresentationClosed E.predictionTheoryClosed)))

end CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean
end HautevilleHouse
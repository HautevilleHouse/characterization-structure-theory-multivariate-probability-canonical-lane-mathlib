import CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ProbabilitySpace where
  carrier : Type
  sigmaAlgebra : MeasurableSpace carrier
  probabilityMeasure : Measure carrier

structure ProbabilityAdmittedObject where
  space : ProbabilitySpace
  convergenceProperty : Prop
  martingaleConvergence : Prop
  limitCharacterization : Prop
  conclusion : limitCharacterization

structure ProbabilityEndgameState where
  object : ProbabilityAdmittedObject

def ProbabilityWitnessClosed (O : ProbabilityAdmittedObject) : Prop :=
  O.limitCharacterization

end CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean
end HautevilleHouse
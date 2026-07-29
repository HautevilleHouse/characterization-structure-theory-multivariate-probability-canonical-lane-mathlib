import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean

structure StochasticCalculusPackage where
  semimartingale : Type u
  quadraticVariation : Type v
  stochasticIntegral : Type w
  itoFormula : Prop
  representationProperty : Prop

structure StochasticCalculusEvidence (S : StochasticCalculusPackage) where
  semimartingaleClosed : S.semimartingale
  quadraticVariationClosed : S.quadraticVariation
  stochasticIntegralClosed : S.stochasticIntegral
  itoFormulaClosed : S.itoFormula
  representationPropertyClosed : S.representationProperty

def StochasticCalculusClosed (S : StochasticCalculusPackage) : Prop :=
  S.semimartingale ∧ S.quadraticVariation ∧ S.stochasticIntegral ∧ S.itoFormula ∧ S.representationProperty

theorem stochastic_calculus_closed_from_evidence (S : StochasticCalculusPackage) (E : StochasticCalculusEvidence S) : StochasticCalculusClosed S :=
  And.intro E.semimartingaleClosed (And.intro E.quadraticVariationClosed (And.intro E.stochasticIntegralClosed (And.intro E.itoFormulaClosed E.representationPropertyClosed)))

end CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean
end HautevilleHouse
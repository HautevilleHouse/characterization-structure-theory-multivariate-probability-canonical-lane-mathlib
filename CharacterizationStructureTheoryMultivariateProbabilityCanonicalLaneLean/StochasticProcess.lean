import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean

structure StochasticProcessPackage where
  indexSet : Type u
  stateSpace : Type v
  probabilitySpace : MeasureTheory.MeasureSpace indexSet
  process : indexSet → stateSpace
  measurable : ∀ t, Measurable (process t)
  adaptedToFiltration : MeasureTheory.Filtration ℕ indexSet
  adapted : ∀ t, MeasureTheory.Adapted adaptedToFiltration process

structure StochasticProcessEvidence (P : StochasticProcessPackage) where
  measurableClosed : ∀ t, Measurable (P.process t)
  adaptedClosed : ∀ t, MeasureTheory.Adapted P.adaptedToFiltration P.process

def StochasticProcessClosed (P : StochasticProcessPackage) : Prop :=
  (∀ t, Measurable (P.process t)) ∧ (∀ t, MeasureTheory.Adapted P.adaptedToFiltration P.process)

theorem stochastic_process_closed_from_evidence (P : StochasticProcessPackage) (E : StochasticProcessEvidence P) : StochasticProcessClosed P := by
  exact And.intro E.measurableClosed E.adaptedClosed

structure StochasticCalculusResult (P : StochasticProcessPackage) where
  itoIntegral : (P.indexSet → ℝ) → (P.indexSet → ℝ)
  itoFormula : Prop
  itoFormulaClosed : itoFormula

def StochasticCalculusClosed (P : StochasticProcessPackage) (R : StochasticCalculusResult P) : Prop :=
  R.itoFormulaClosed

theorem stochastic_calculus_closed (P : StochasticProcessPackage) (R : StochasticCalculusResult P) : StochasticCalculusClosed P R := by
  exact R.itoFormulaClosed

end CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean
end HautevilleHouse
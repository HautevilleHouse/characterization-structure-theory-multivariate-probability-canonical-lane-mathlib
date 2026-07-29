import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean

structure LimitTheoremsPackage where
  lawOfLargeNumbers : Prop
  centralLimitTheorem : Prop
  largeDeviations : Prop
  stability : Prop

structure LimitTheoremsEvidence (L : LimitTheoremsPackage) where
  lawOfLargeNumbersClosed : L.lawOfLargeNumbers
  centralLimitTheoremClosed : L.centralLimitTheorem
  largeDeviationsClosed : L.largeDeviations
  stabilityClosed : L.stability

def LimitTheoremsClosed (L : LimitTheoremsPackage) : Prop :=
  L.lawOfLargeNumbers ∧ L.centralLimitTheorem ∧ L.largeDeviations ∧ L.stability

theorem limit_theorems_closed_from_evidence (L : LimitTheoremsPackage) (E : LimitTheoremsEvidence L) : LimitTheoremsClosed L :=
  And.intro E.lawOfLargeNumbersClosed (And.intro E.centralLimitTheoremClosed (And.intro E.largeDeviationsClosed E.stabilityClosed))

end CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean
end HautevilleHouse
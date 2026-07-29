import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean

structure LimitTheoremsBridgePackage (A : AdmissibleClass) where
  lawLargeNumbers : Prop
  centralLimitTheorem : Prop
  lawOfIteratedLogarithm : Prop
  uniformIntegrability : Prop

structure LimitTheoremsBridgeEvidence {A : AdmissibleClass} (P : LimitTheoremsBridgePackage A) where
  lawLargeNumbersClosed : P.lawLargeNumbers
  centralLimitTheoremClosed : P.centralLimitTheorem
  lawOfIteratedLogarithmClosed : P.lawOfIteratedLogarithm
  uniformIntegrabilityClosed : P.uniformIntegrability

def LimitTheoremsBridgeClosed {A : AdmissibleClass} (P : LimitTheoremsBridgePackage A) : Prop :=
  P.lawLargeNumbers ∧ P.centralLimitTheorem ∧ P.lawOfIteratedLogarithm ∧ P.uniformIntegrability

theorem limit_theorems_bridge_closed_from_evidence {A : AdmissibleClass}
    (P : LimitTheoremsBridgePackage A) (E : LimitTheoremsBridgeEvidence P) :
    LimitTheoremsBridgeClosed P := by
  exact And.intro E.lawLargeNumbersClosed
    (And.intro E.centralLimitTheoremClosed
      (And.intro E.lawOfIteratedLogarithmClosed E.uniformIntegrabilityClosed))

end CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean
end HautevilleHouse
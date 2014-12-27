module Test.MuCheck.Operators (comparators,
                          predNums,
                          binAriths,
                          arithLists,
                          allOps) where

import Test.MuCheck.MuOp
import Test.MuCheck.Utils.Common
import Language.Haskell.Exts (Name(Symbol), Exp(Var), QName(UnQual), Name(Ident))

-- | all available operators
allOps = concat [comparators, predNums, binAriths, arithLists]

-- | comparison operators ["<", ">", "<=", ">=", "/=", "=="]
comparators = coupling (==>) $ map Symbol ["<", ">", "<=", ">=", "/=", "=="]

-- | predicates ["pred", "id", "succ"]
predNums = coupling (==>) $ map varfn ["pred", "id", "succ"]

-- | binary arithmetic ["+", "-", "*", "/"]
binAriths = coupling (==>) $ map Symbol ["+", "-", "*", "/"]

-- | functions on lists ["sum", "product", "maximum", "minimum", "head", "last"]
arithLists = coupling (==>) $ map varfn ["sum", "product", "maximum", "minimum", "head", "last"]

-- utilities
varfn = Var . UnQual . Ident

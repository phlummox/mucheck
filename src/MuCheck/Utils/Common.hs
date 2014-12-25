module MuCheck.Utils.Common where

import System.FilePath (splitExtension)

-- choose [1,2,3,4,5] 4
--  = [[2,3,4,5],[1,3,4,5],[1,2,4,5],[1,2,3,5],[1,2,3,4]]
choose :: [b] -> Int -> [[b]]
_      `choose` 0       = [[]]
[]     `choose` _       =  []
(x:xs) `choose` k       =  (x:) `fmap` (xs `choose` (k-1)) ++ xs `choose` k

-- generating mutant files names
-- e.g.: "Quicksort.hs" ==> "Quicksort_1.hs", "Quicksort_2.hs", etc.
genFileNames :: String -> [String]
genFileNames s =  map newname [1..]
    where (name, ext) = splitExtension s
          newname i= name ++ "_" ++ show i ++ ext

-- replace first element in a list given old and new values
replace :: Eq a => (a,a) -> [a] -> [a]
replace (o,n) lst = map replaceit lst
  where replaceit v
          | v == o = n
          | otherwise = v

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:xs) = Just x
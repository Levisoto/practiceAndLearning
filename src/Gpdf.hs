{-# LANGUAGE ScopedTypeVariables, MultiParamTypeClasses #-}
module Gpdf where

import Graphics.PDF
import Graphics.PDF.Typesetting

main :: IO()
main = do
    let rect = PDFRect 0 0 600 400
    runPdf "demo.pdf" (standardDocInfo { author=toPDFString "alpheccar", compressed = False}) rect $ do
        myDocument

myContent = displayFormattedText (Rectangle (80 :+ 0) (500 :+ 300)) NormalPara Normal $ do 
   paragraph $ do
        txt $ "Your Company: "
        forceNewLine
        txt $ "State: "
        forceNewLine
        txt $ "Email: "
        forceNewLine
        txt $ "Name: "

-- myDocument :: PDF () 
myDocument = do
   page1 <- addPage Nothing
   drawWithPage page1 $ do
    strokeColor red
    setWidth 0.5
    stroke $ Rectangle 800 800
    myContent

data MyVertStyles = NormalPara
                  | CirclePara !PDFFloat

data MyParaStyles = Normal
                  | Bold

instance ComparableStyle MyParaStyles where
  isSameStyleAs Normal Normal = True
  isSameStyleAs Bold Bold = True
  isSameStyleAs _ _ = False

instance Style MyParaStyles where
    textStyle Normal = TextStyle (PDFFont Times_Roman 10) black black FillText 1.0 1.0 1.0 1.0
    textStyle Bold = TextStyle (PDFFont Times_Bold 12) black black FillText 1.0 1.0 1.0 1.0

    sentenceStyle _ = Nothing
    wordStyle _ = Nothing
    
instance ParagraphStyle MyVertStyles MyParaStyles where
    lineWidth _ w _ = w
           
instance ComparableStyle MyVertStyles where
    isSameStyleAs NormalPara NormalPara = True
    isSameStyleAs _ _ = False

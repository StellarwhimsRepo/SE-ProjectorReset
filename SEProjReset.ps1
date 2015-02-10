# projector reset to combat double spawns before reboot.
    #load the save
    $filePath = 'yoursavepath\SANDBOX_0_0_0_.sbs'
    Write-Host -ForegroundColor Green "Projector Clean loading ....  "
    [xml]$myXML = Get-Content $filePath -Encoding UTF8
    $ns = New-Object System.Xml.XmlNamespaceManager($myXML.NameTable)
    $ns.AddNamespace("xsi", "http://www.w3.org/2001/XMLSchema-instance")


    #all projector reset
    Write-Host -ForegroundColor Green "Projectors Resetting ... "
    $allprojections = $myXML.SelectNodes("//SectorObjects/MyObjectBuilder_EntityBase[(@xsi:type='MyObjectBuilder_CubeGrid')]/CubeBlocks/MyObjectBuilder_CubeBlock[(@xsi:type='MyObjectBuilder_Projector')]/ProjectedGrid", $ns)
    ForEach($projection in $allprojections){
    $projection.ParentNode.RemoveChild($projection)
    }
    Write-Host -ForegroundColor Green "All Projectors Reset!! "
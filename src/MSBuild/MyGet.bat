@echo Off

REM Package
call %nuget% pack "SemanticVersioning.MSBuild.Nuspec" -Version %PackageVersion%
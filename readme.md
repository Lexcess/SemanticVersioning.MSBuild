# SemanticVersioning.MSBuild

##Introduction

This is a project for injecting Semantic Versioning to binaries via MSBuild at compile time. It does **not** rely on PowerShell or MSBuild Community Tasks or any other package dependency.

##Quick Start

On your Build Server: set the following MSBuild properties:

  * `$SemanticVersion` = the Major.Minor.Patch version i.e. `1.0.0`, `5.2.0` or `1.1.7`
  * `$Tag` = the arbitary tag of a pre-release i.e. `-beta1`, `-RC5` or `-Build2`

The package by default works on the convention that Assembly attributes are in a AssemblyInfo file this can be overridden). It will make *no* changes to your source tree, all modifications are made at compile time.

This project currently supports Semantic Versioning for C# via MSBuild. Future goals are to support both VB and Native C++ projects (via resource manifests).

##How it works. 

By default the package will make no changes to your source tree. When building it fires on before CoreCompile to modify a clone of file with the name AssemblyInfo excluding the extension (you can however inject alternative file names via $VersionFileName).

Typically for local builds in Visual Studio you wouldn't bother with Semantic Versioning as the changes are too rapid so you'll end up with 0.0.0 versioning. However by adding the appropriate properties to your CsProj file or via MSBuild Parameters you can achieve this locally.

This package's main use case is in Builds where you can clearly inject the Semantic Version via the following parameters:

  * `$SemanticVersion` = D.D.D, the Major Minor and Patch as integer digits separated by periods. e.g. `1.0.0` or `5.2.3`
  * `$Tag` = -AADD+, A tag consisting of a Dash followed by any an arbitarty alphanumeric. e.g. `-Beta12`, `-Build1` or `-RC5`
  * `$VersionFileName` = ABC123, an alphanumeric filename (excl. path and extension) where AssemblyAttributes are located i.e. CommonVersionInfo

## What Assembly Attributes are injected at Compile time?

The package will update your Assembly's

  * AssemblyVersion => the Numeric portion of the version
  * AssemblyFileVersion => the Numeric portion of the version
  * AssemblyInformationalVersion => the Numeric portion of the version and the Tag

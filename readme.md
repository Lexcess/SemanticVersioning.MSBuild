A project for adding SemanticVersioning to MSBuild Projects

This project currently supports Semantic Versioning for C# via MSBuild. Future goals are to support both VB and Native C++ projects (via resource manifests).

How it works. 

By default the package will make no changes to your source tree. When building it fires on before CoreCompile to modify a clone of file with the name AssemblyInfo excluding the extension (you can however inject alternative file names via $VersionFileName).

Typically for local builds in Visual Studio you wouldn't bother with Semantic Versioning as the changes are too rapid so you'll end up with 0.0.0 versioning. However by adding the appropriate properties to your CsProj file or via MSBuild Parameters you can achieve this locally.

This package's main use case is in Builds where you can clearly inject the Semantic Version via the following parameters:

$SemanticVersion = D.D.D, the Major Minor and Patch as integer digits separated by periods. e.g. 1.0.0 or 5.2.3
$Tag = -AADD+, A tag consisting of a Dash followed by any an arbitarty alphanumeric. e.g. -Beta12, -Build1 or -RC5
$VersionFileName = ABC123, an alphanumeric filename (excl. path and extension) where AssemblyAttributes are located i.e. CommonVersionInfo

The package will then correctly update your Assembly's

AssemblyVersion => the Numeric portion of the version
AssemblyFileVersion => the Numeric portion of the version
AssemblyInformationalVersion => the Numeric portion of the version and the Tag

//
//  UTConstants.swift
//  Cutis
//
//  Created by Tamas Lustyik on 2016. 01. 09..
//  Copyright © 2016. Tamas Lustyik. All rights reserved.
//

import Foundation
#if os(iOS)
import MobileCoreServices
#endif

extension UTType {
    /// generic base type for most things (files, directories)
    ///
    /// UTI: public.item
    public static let Item = UTType(kUTTypeItem as String)

    /// base type for anything containing user-viewable document content
    /// (documents, pasteboard data, and document packages)
    ///
    /// UTI: public.content
    public static let Content = UTType(kUTTypeContent as String)
    
    /// base type for content formats supporting mixed embedded content
    /// (i.e., compound documents)
    ///
    /// UTI: public.composite-content
    ///
    /// conforms to: public.content
    public static let CompositeContent = UTType(kUTTypeCompositeContent as String)

    /// base type for messages (email, IM, etc.)
    ///
    /// UTI: public.message
    public static let Message = UTType(kUTTypeMessage as String)
    
    /// contact information, e.g. for a person, group, organization
    ///
    /// UTI: public.contact
    public static let Contact = UTType(kUTTypeContact as String)
    
    /// an archive of files and directories
    ///
    /// UTI: public.archive
    public static let Archive = UTType(kUTTypeArchive as String)
    
    /// a data item mountable as a volume
    ///
    /// UTI: public.disk-image
    public static let DiskImage = UTType(kUTTypeDiskImage as String)

    
    /// base type for any sort of simple byte stream,
    /// including files and in-memory data
    ///
    /// UTI: public.data
    ///
    /// conforms to: public.item
    public static let Data = UTType(kUTTypeData as String)
    
    /// file system directory
    /// (includes packages AND folders)
    ///
    /// UTI: public.directory
    ///
    /// conforms to: public.item
    public static let Directory = UTType(kUTTypeDirectory as String)
    
    /// symlink and alias file types conform to this UTI
    ///
    /// UTI: com.apple.resolvable
    public static let Resolvable = UTType(kUTTypeResolvable as String)
    
    /// a symbolic link
    ///
    /// UTI: public.symlink
    ///
    /// conforms to: public.item, com.apple.resolvable
    public static let SymLink = UTType(kUTTypeSymLink as String)
    
    /// an executable item
    ///
    /// UTI: public.executable
    ///
    /// conforms to: public.item
    @available(OSX 10.5, iOS 8.0, *)
    public static let Executable = UTType(kUTTypeExecutable as String)
    
    /// a volume mount point (resolvable, resolves to the root dir of a volume)
    ///
    /// UTI: com.apple.mount-point
    ///
    /// conforms to: public.item, com.apple.resolvable
    public static let MountPoint = UTType(kUTTypeMountPoint as String)
    
    /// a fully-formed alias file
    ///
    /// UTI: com.apple.alias-file
    ///
    /// conforms to: public.data, com.apple.resolvable
    public static let AliasFile = UTType(kUTTypeAliasFile as String)
    
    /// raw alias data
    ///
    /// UTI: com.apple.alias-record
    ///
    /// conforms to: public.data, com.apple.resolvable
    public static let AliasRecord = UTType(kUTTypeAliasRecord as String)
    
    /// URL bookmark
    ///
    /// UTI: com.apple.bookmark
    ///
    /// conforms to: public.data, com.apple.resolvable
    @available(OSX 10.10, iOS 8.0, *)
    public static let URLBookmarkData = UTType(kUTTypeURLBookmarkData as String)

    /// The bytes of a URL
    /// (OSType 'url ')
    ///
    /// UTI: public.url
    ///
    /// conforms to: public.data
    public static let URL = UTType(kUTTypeURL as String)
    
    /// The text of a "file:" URL
    /// (OSType 'furl')
    ///
    /// UTI: public.file-url
    ///
    /// conforms to: public.url
    public static let FileURL = UTType(kUTTypeFileURL as String)

    /// base type for all text-encoded data,
    /// including text with markup (HTML, RTF, etc.)
    ///
    /// UTI: public.text
    ///
    /// conforms to: public.data, public.content
    public static let Text = UTType(kUTTypeText as String)
    
    /// text with no markup, unspecified encoding
    ///
    /// UTI: public.plain-text
    ///
    /// conforms to: public.text
    public static let PlainText = UTType(kUTTypePlainText as String)
    
    /// plain text, UTF-8 encoding
    /// (OSType 'utf8', NSPasteboardType "NSStringPBoardType")
    ///
    /// UTI: public.utf8-plain-text
    ///
    /// conforms to: public.plain-text
    public static let UTF8PlainText = UTType(kUTTypeUTF8PlainText as String)
    
    /// plain text, UTF-16 encoding, with BOM, or if BOM
    /// is not present, has "external representation"
    /// byte order (big-endian).
    /// (OSType 'ut16')
    ///
    /// UTI: public.utf16-external-plain-text
    ///
    /// conforms to: public.plain-text
    public static let UTF16ExternalPlainText = UTType(kUTTypeUTF16ExternalPlainText as String)
    
    /// plain text, UTF-16 encoding, native byte order, optional BOM
    /// (OSType 'utxt')
    ///
    /// UTI: public.utf16-plain-text
    ///
    /// conforms to: public.plain-text
    public static let UTF16PlainText = UTType(kUTTypeUTF16PlainText as String)
    
    /// text containing delimited values
    ///
    /// UTI: public.delimited-values-text
    ///
    /// conforms to: public.text
    @available(OSX 10.10, iOS 8.0, *)
    public static let DelimitedText = UTType(kUTTypeDelimitedText as String)
    
    /// text containing comma-separated values (.csv)
    ///
    /// UTI: public.comma-separated-values-text
    ///
    /// conforms to: public.delimited-values-text
    @available(OSX 10.10, iOS 8.0, *)
    public static let CommaSeparatedText = UTType(kUTTypeCommaSeparatedText as String)
    
    /// text containing tab-separated values
    ///
    /// UTI: public.tab-separated-values-text
    ///
    /// conforms to: public.delimited-values-text
    @available(OSX 10.10, iOS 8.0, *)
    public static let TabSeparatedText = UTType(kUTTypeTabSeparatedText as String)
    
    /// UTF-8 encoded text containing tab-separated values
    ///
    /// UTI: public.utf8-tab-separated-values-text
    ///
    /// conforms to: public.tab-separated-values-text, public.utf8-plain-text
    @available(OSX 10.10, iOS 8.0, *)
    public static let UTF8TabSeparatedText = UTType(kUTTypeUTF8TabSeparatedText as String)
    
    /// Rich Text Format
    ///
    /// UTI: public.rtf
    ///
    /// conforms to: public.text
    public static let RTF = UTType(kUTTypeRTF as String)

    /// HTML, any version
    ///
    /// UTI: public.html
    ///
    /// conforms to: public.text
    public static let HTML = UTType(kUTTypeHTML as String)
    
    /// generic XML
    ///
    /// UTI: public.xml
    ///
    /// conforms to: public.text
    public static let XML = UTType(kUTTypeXML as String)

    /// abstract type for source code (any language)
    ///
    /// UTI: public.source-code
    ///
    /// conforms to: public.plain-text
    public static let SourceCode = UTType(kUTTypeSourceCode as String)
    
    /// assembly language source (.s)
    ///
    /// UTI: public.assembly-source
    ///
    /// conforms to: public.source-code
    @available(OSX 10.10, iOS 8.0, *)
    public static let AssemblyLanguageSource = UTType(kUTTypeAssemblyLanguageSource as String)
    
    /// C source code (.c)
    ///
    /// UTI: public.c-source
    ///
    /// conforms to: public.source-code
    public static let CSource = UTType(kUTTypeCSource as String)
    
    /// Objective-C source code (.m)
    ///
    /// UTI: public.objective-c-source
    ///
    /// conforms to: public.source-code
    public static let ObjectiveCSource = UTType(kUTTypeObjectiveCSource as String)
    
    /// Swift source code (.swift)
    ///
    /// UTI: public.swift-source
    ///
    /// conforms to: public.source-code
    @available(OSX 10.11, iOS 9.0, *)
    public static let SwiftSource = UTType(kUTTypeSwiftSource as String)
    
    /// C++ source code (.cp, etc.)
    ///
    /// UTI: public.c-plus-plus-source
    ///
    /// conforms to: public.source-code
    public static let CPlusPlusSource = UTType(kUTTypeCPlusPlusSource as String)
    
    /// Objective-C++ source code
    ///
    /// UTI: public.objective-c-plus-plus-source
    ///
    /// conforms to: public.source-code
    public static let ObjectiveCPlusPlusSource = UTType(kUTTypeObjectiveCPlusPlusSource as String)
    
    /// C header
    ///
    /// UTI: public.c-header
    ///
    /// conforms to: public.source-code
    public static let CHeader = UTType(kUTTypeCHeader as String)
    
    /// C++ header
    ///
    /// UTI: public.c-plus-plus-header
    ///
    /// conforms to: public.source-code
    public static let CPlusPlusHeader = UTType(kUTTypeCPlusPlusHeader as String)
    
    /// Java source code
    ///
    /// UTI: com.sun.java-source
    ///
    /// conforms to: public.source-code
    public static let JavaSource = UTType(kUTTypeJavaSource as String)

    /// scripting language source
    ///
    /// UTI: public.script
    ///
    /// conforms to: public.source-code
    @available(OSX 10.10, iOS 8.0, *)
    public static let Script = UTType(kUTTypeScript as String)
    
    /// AppleScript text format (.applescript)
    ///
    /// UTI: com.apple.applescript.text
    ///
    /// conforms to: public.script
    @available(OSX 10.10, iOS 8.0, *)
    public static let AppleScript = UTType(kUTTypeAppleScript as String)
    
    /// Open Scripting Architecture script binary format (.scpt)
    ///
    /// UTI: com.apple.applescript.script
    ///
    /// conforms to: public.data, public.script
    @available(OSX 10.10, iOS 8.0, *)
    public static let OSAScript = UTType(kUTTypeOSAScript as String)
    
    /// Open Scripting Architecture script bundle format (.scptd)
    ///
    /// UTI: com.apple.applescript.script-bundle
    ///
    /// conforms to: com.apple.bundle, com.apple.package, public.script
    @available(OSX 10.10, iOS 8.0, *)
    public static let OSAScriptBundle = UTType(kUTTypeOSAScriptBundle as String)
    
    /// JavaScript source code
    ///
    /// UTI: com.netscape.javascript-source
    ///
    /// conforms to: public.source-code, public.executable
    @available(OSX 10.10, iOS 8.0, *)
    public static let JavaScript = UTType(kUTTypeJavaScript as String)
    
    /// base type for shell scripts
    ///
    /// UTI: public.shell-script
    ///
    /// conforms to: public.script
    @available(OSX 10.10, iOS 8.0, *)
    public static let ShellScript = UTType(kUTTypeShellScript as String)
    
    /// Perl script
    ///
    /// UTI: public.perl-script
    ///
    /// conforms to: public.shell-script
    @available(OSX 10.10, iOS 8.0, *)
    public static let PerlScript = UTType(kUTTypePerlScript as String)
    
    /// Python script
    ///
    /// UTI: public.python-script
    ///
    /// conforms to: public.shell-script
    @available(OSX 10.10, iOS 8.0, *)
    public static let PythonScript = UTType(kUTTypePythonScript as String)
    
    /// Ruby script
    ///
    /// UTI: public.ruby-script
    ///
    /// conforms to: public.shell-script
    @available(OSX 10.10, iOS 8.0, *)
    public static let RubyScript = UTType(kUTTypeRubyScript as String)
    
    /// PHP script
    ///
    /// UTI: public.php-script
    ///
    /// conforms to: public.shell-script
    @available(OSX 10.10, iOS 8.0, *)
    public static let PHPScript = UTType(kUTTypePHPScript as String)

    /// JavaScript object notation (JSON) data
    ///
    /// NOTE: JSON almost but doesn't quite conform to
    /// com.netscape.javascript-source
    ///
    /// UTI: public.json
    ///
    /// conforms to: public.text
    @available(OSX 10.10, iOS 8.0, *)
    public static let JSON = UTType(kUTTypeJSON as String)
    
    /// base type for property lists
    ///
    /// UTI: com.apple.property-list
    ///
    /// conforms to: public.data
    @available(OSX 10.10, iOS 8.0, *)
    public static let PropertyList = UTType(kUTTypePropertyList as String)
    
    /// XML property list
    ///
    /// UTI: com.apple.xml-property-list
    ///
    /// conforms to: public.xml, com.apple.property-list
    @available(OSX 10.10, iOS 8.0, *)
    public static let XMLPropertyList = UTType(kUTTypeXMLPropertyList as String)
    
    /// XML property list
    ///
    /// UTI: com.apple.binary-property-list
    ///
    /// conforms to: com.apple.property-list
    @available(OSX 10.10, iOS 8.0, *)
    public static let BinaryPropertyList = UTType(kUTTypeBinaryPropertyList as String)

    /// Adobe PDF
    ///
    /// UTI: com.adobe.pdf
    ///
    /// conforms to: public.data, public.composite-content
    public static let PDF = UTType(kUTTypePDF as String)
    
    /// Rich Text Format Directory
    /// (RTF with content embedding, on-disk format)
    ///
    /// UTI: com.apple.rtfd
    ///
    /// conforms to: com.apple.package, public.composite-content
    public static let RTFD = UTType(kUTTypeRTFD as String)
    
    /// Flattened RTFD (pasteboard format)
    ///
    /// UTI: com.apple.flat-rtfd
    ///
    /// conforms to: public.data, public.composite-content
    public static let FlatRTFD = UTType(kUTTypeFlatRTFD as String)
    
    /// MLTE (Textension) format for mixed text & multimedia data
    /// (OSType 'txtn')
    ///
    /// UTI: com.apple.txn.text-multimedia-data
    ///
    /// conforms to: public.data, public.composite-content
    public static let TXNTextAndMultimediaData = UTType(kUTTypeTXNTextAndMultimediaData as String)
    
    /// The WebKit webarchive format
    ///
    /// UTI: com.apple.webarchive
    ///
    /// conforms to: public.data, public.composite-content
    public static let WebArchive = UTType(kUTTypeWebArchive as String)

    /// abstract image data
    ///
    /// UTI: public.image
    ///
    /// conforms to: public.data, public.content
    public static let Image = UTType(kUTTypeImage as String)
    
    /// JPEG image
    ///
    /// UTI: public.jpeg
    ///
    /// conforms to: public.image
    public static let JPEG = UTType(kUTTypeJPEG as String)
    
    /// JPEG-2000 image
    ///
    /// UTI: public.jpeg-2000
    ///
    /// conforms to: public.image
    public static let JPEG2000 = UTType(kUTTypeJPEG2000 as String)
    
    /// TIFF image
    ///
    /// UTI: public.tiff
    ///
    /// conforms to: public.image
    public static let TIFF = UTType(kUTTypeTIFF as String)
    
    /// Quickdraw PICT format
    ///
    /// UTI: com.apple.pict
    ///
    /// conforms to: public.image
    public static let PICT = UTType(kUTTypePICT as String)
    
    /// GIF image
    ///
    /// UTI: com.compuserve.gif
    ///
    /// conforms to: public.image
    public static let GIF = UTType(kUTTypeGIF as String)
    
    /// PNG image
    ///
    /// UTI: public.png
    ///
    /// conforms to: public.image
    public static let PNG = UTType(kUTTypePNG as String)
    
    /// QuickTime image format (OSType 'qtif')
    ///
    /// UTI: com.apple.quicktime-image
    ///
    /// conforms to: public.image
    public static let QuickTimeImage = UTType(kUTTypeQuickTimeImage as String)
    
    /// Apple icon data
    ///
    /// UTI: com.apple.icns
    ///
    /// conforms to: public.image
    public static let AppleICNS = UTType(kUTTypeAppleICNS as String)
    
    /// Windows bitmap
    ///
    /// UTI: com.microsoft.bmp
    ///
    /// conforms to: public.image
    public static let BMP = UTType(kUTTypeBMP as String)
    
    /// Windows icon data
    ///
    /// UTI: com.microsoft.ico
    ///
    /// conforms to: public.image
    public static let ICO = UTType(kUTTypeICO as String)
    
    /// base type for raw image data (.raw)
    ///
    /// UTI: public.camera-raw-image
    ///
    /// conforms to: public.image
    @available(OSX 10.10, iOS 8.0, *)
    public static let RawImage = UTType(kUTTypeRawImage as String)
    
    /// SVG image
    ///
    /// UTI: public.svg-image
    ///
    /// conforms to: public.image
    @available(OSX 10.10, iOS 8.0, *)
    public static let ScalableVectorGraphics = UTType(kUTTypeScalableVectorGraphics as String)

    /// audio and/or video content
    ///
    /// UTI: public.audiovisual-content
    ///
    /// conforms to: public.data, public.content
    public static let AudiovisualContent = UTType(kUTTypeAudiovisualContent as String)
    
    /// A media format which may contain both video and audio.
    /// Corresponds to what users would label a "movie"
    ///
    /// UTI: public.movie
    ///
    /// conforms to: public.audiovisual-content
    public static let Movie = UTType(kUTTypeMovie as String)
    
    /// pure video (no audio)
    ///
    /// UTI: public.video
    ///
    /// conforms to: public.movie
    public static let Video = UTType(kUTTypeVideo as String)
    
    /// pure audio (no video)
    ///
    /// UTI: public.audio
    ///
    /// conforms to: public.audiovisual-content
    public static let Audio = UTType(kUTTypeAudio as String)
    
    /// QuickTime movie
    ///
    /// UTI: com.apple.quicktime-movie
    ///
    /// conforms to: public.movie
    public static let QuickTimeMovie = UTType(kUTTypeQuickTimeMovie as String)
    
    /// MPEG-1 or MPEG-2 movie
    ///
    /// UTI: public.mpeg
    ///
    /// conforms to: public.movie
    public static let MPEG = UTType(kUTTypeMPEG as String)
    
    /// MPEG-2 video
    ///
    /// UTI: public.mpeg-2-video
    ///
    /// conforms to: public.video
    @available(OSX 10.10, iOS 8.0, *)
    public static let MPEG2Video = UTType(kUTTypeMPEG2Video as String)
    
    /// MPEG-2 Transport Stream movie format
    ///
    /// UTI: public.mpeg-2-transport-stream
    ///
    /// conforms to: public.movie
    @available(OSX 10.10, iOS 8.0, *)
    public static let MPEG2TransportStream = UTType(kUTTypeMPEG2TransportStream as String)
    
    /// MP3 audio
    ///
    /// UTI: public.mp3
    ///
    /// conforms to: public.audio
    public static let MP3 = UTType(kUTTypeMP3 as String)
    
    /// MPEG-4 movie
    ///
    /// UTI: public.mpeg-4
    ///
    /// conforms to: public.movie
    public static let MPEG4 = UTType(kUTTypeMPEG4 as String)
    
    /// MPEG-4 audio layer
    ///
    /// UTI: public.mpeg-4-audio
    ///
    /// conforms to: public.mpeg-4, public.audio
    public static let MPEG4Audio = UTType(kUTTypeMPEG4Audio as String)
    
    /// Apple protected MPEG4 format
    /// (.m4p, iTunes music store format)
    ///
    /// UTI: com.apple.protected-mpeg-4-audio
    ///
    /// conforms to: public.audio
    public static let AppleProtectedMPEG4Audio = UTType(kUTTypeAppleProtectedMPEG4Audio as String)
    
    /// Apple protected MPEG-4 movie
    ///
    /// UTI: com.apple.protected-mpeg-4-video
    ///
    /// conforms to: com.apple.m4v-video
    @available(OSX 10.10, iOS 8.0, *)
    public static let AppleProtectedMPEG4Video = UTType(kUTTypeAppleProtectedMPEG4Video as String)
    
    /// Audio Video Interleaved (AVI) movie format
    ///
    /// UTI: public.avi
    ///
    /// conforms to: public.movie
    @available(OSX 10.10, iOS 8.0, *)
    public static let AVIMovie = UTType(kUTTypeAVIMovie as String)
    
    /// AIFF audio format
    ///
    /// UTI: public.aiff-audio
    ///
    /// conforms to: public.aifc-audio
    @available(OSX 10.10, iOS 8.0, *)
    public static let AudioInterchangeFileFormat = UTType(kUTTypeAudioInterchangeFileFormat as String)
    
    /// Waveform audio format (.wav)
    ///
    /// UTI: com.microsoft.waveform-audio
    ///
    /// conforms to: public.audio
    @available(OSX 10.10, iOS 8.0, *)
    public static let WaveformAudio = UTType(kUTTypeWaveformAudio as String)
    
    /// MIDI audio format
    ///
    /// UTI: public.midi-audio
    ///
    /// conforms to: public.audio
    @available(OSX 10.10, iOS 8.0, *)
    public static let MIDIAudio = UTType(kUTTypeMIDIAudio as String)
    
    /// base type for playlists
    ///
    /// UTI: public.playlist
    @available(OSX 10.10, iOS 8.0, *)
    public static let Playlist = UTType(kUTTypePlaylist as String)
    
    /// M3U or M3U8 playlist
    ///
    /// UTI: public.m3u-playlist
    ///
    /// conforms to: public.text, public.playlist
    @available(OSX 10.10, iOS 8.0, *)
    public static let M3UPlaylist = UTType(kUTTypeM3UPlaylist as String)

    /// a user-browsable directory (i.e., not a package)
    ///
    /// UTI: public.folder
    ///
    /// conforms to: public.directory
    public static let Folder = UTType(kUTTypeFolder as String)
    
    /// the root folder of a volume/mount point
    ///
    /// UTI: public.volume
    ///
    /// conforms to: public.folder
    public static let Volume = UTType(kUTTypeVolume as String)
    
    /// a packaged directory
    ///
    /// UTI: com.apple.package
    ///
    /// conforms to: public.directory
    public static let Package = UTType(kUTTypePackage as String)
    
    /// a directory conforming to one of the CFBundle layouts
    ///
    /// UTI: com.apple.bundle
    ///
    /// conforms to: public.directory
    public static let Bundle = UTType(kUTTypeBundle as String)
    
    /// base type for bundle-based plugins
    ///
    /// UTI: com.apple.plugin
    ///
    /// conforms to: com.apple.bundle, com.apple.package
    @available(OSX 10.10, iOS 8.0, *)
    public static let PluginBundle = UTType(kUTTypePluginBundle as String)
    
    /// a Spotlight metadata importer
    ///
    /// UTI: com.apple.metadata-importer
    ///
    /// conforms to: com.apple.plugin
    @available(OSX 10.10, iOS 8.0, *)
    public static let SpotlightImporter = UTType(kUTTypeSpotlightImporter as String)
    
    /// a QuickLook preview generator
    ///
    /// UTI: com.apple.quicklook-generator
    ///
    /// conforms to: com.apple.plugin
    @available(OSX 10.10, iOS 8.0, *)
    public static let QuickLookGenerator = UTType(kUTTypeQuickLookGenerator as String)
    
    /// an XPC service
    ///
    /// UTI: com.apple.xpc-service
    ///
    /// conforms to: com.apple.bundle, com.apple.package
    @available(OSX 10.10, iOS 8.0, *)
    public static let XPCService = UTType(kUTTypeXPCService as String)
    
    /// a Mac OS X framework
    ///
    /// UTI: com.apple.framework
    ///
    /// conforms to: com.apple.bundle
    public static let Framework = UTType(kUTTypeFramework as String)

    /// base type for OS X applications, launchable items
    ///
    /// UTI: com.apple.application
    ///
    /// conforms to: public.executable
    public static let Application = UTType(kUTTypeApplication as String)
    
    /// a bundled application
    ///
    /// UTI: com.apple.application-bundle
    ///
    /// conforms to: com.apple.application, com.apple.bundle, com.apple.package
    public static let ApplicationBundle = UTType(kUTTypeApplicationBundle as String)
    
    /// a single-file Carbon/Classic application
    ///
    /// UTI: com.apple.application-file
    ///
    /// conforms to: com.apple.application, public.data
    public static let ApplicationFile = UTType(kUTTypeApplicationFile as String)
    
    /// a UNIX executable (flat file)
    ///
    /// UTI: public.unix-executable
    ///
    /// conforms to: public.data, public.executable
    @available(OSX 10.10, iOS 8.0, *)
    public static let UnixExecutable = UTType(kUTTypeUnixExecutable as String)
    
    /// a Windows executable (.exe files)
    ///
    /// UTI: com.microsoft.windows-executable
    ///
    /// conforms to: public.data, public.executable
    @available(OSX 10.10, iOS 8.0, *)
    public static let WindowsExecutable = UTType(kUTTypeWindowsExecutable as String)
    
    /// a Java class
    ///
    /// UTI: com.sun.java-class
    ///
    /// conforms to: public.data, public.executable
    @available(OSX 10.10, iOS 8.0, *)
    public static let JavaClass = UTType(kUTTypeJavaClass as String)
    
    /// a Java archive (.jar)
    ///
    /// UTI: com.sun.java-archive
    ///
    /// conforms to: public.zip-archive, public.executable
    @available(OSX 10.10, iOS 8.0, *)
    public static let JavaArchive = UTType(kUTTypeJavaArchive as String)
    
    /// a System Preferences pane
    ///
    /// UTI: com.apple.systempreference.prefpane
    ///
    /// conforms to: com.apple.package, com.apple.bundle
    @available(OSX 10.10, iOS 8.0, *)
    public static let SystemPreferencesPane = UTType(kUTTypeSystemPreferencesPane as String)
    
    /// a GNU zip archive (gzip)
    ///
    /// UTI: org.gnu.gnu-zip-archive
    ///
    /// conforms to: public.data, public.archive
    @available(OSX 10.10, iOS 8.0, *)
    public static let GNUZipArchive = UTType(kUTTypeGNUZipArchive as String)
    
    /// a bzip2 archive (.bz2)
    ///
    /// UTI: public.bzip2-archive
    ///
    /// conforms to: public.data, public.archive
    @available(OSX 10.10, iOS 8.0, *)
    public static let Bzip2Archive = UTType(kUTTypeBzip2Archive as String)
    
    /// a zip archive
    ///
    /// UTI: public.zip-archive
    ///
    /// conforms to: com.pkware.zip-archive
    @available(OSX 10.10, iOS 8.0, *)
    public static let ZipArchive = UTType(kUTTypeZipArchive as String)

    /// base spreadsheet document type
    ///
    /// UTI: public.spreadsheet
    ///
    /// conforms to: public.content
    @available(OSX 10.10, iOS 8.0, *)
    public static let Spreadsheet = UTType(kUTTypeSpreadsheet as String)
    
    /// base presentation document type
    ///
    /// UTI: public.presentation
    ///
    /// conforms to: public.composite-content
    @available(OSX 10.10, iOS 8.0, *)
    public static let Presentation = UTType(kUTTypePresentation as String)
    
    /// a database store
    ///
    /// UTI: public.database
    @available(OSX 10.4, iOS 8.0, *)
    public static let Database = UTType(kUTTypeDatabase as String)

    /// VCard format
    ///
    /// UTI: public.vcard
    ///
    /// conforms to: public.text, public.contact
    public static let VCard = UTType(kUTTypeVCard as String)
    
    /// to-do item
    ///
    /// UTI: public.to-do-item
    @available(OSX 10.10, iOS 8.0, *)
    public static let ToDoItem = UTType(kUTTypeToDoItem as String)
    
    /// calendar event
    ///
    /// UTI: public.calendar-event
    @available(OSX 10.10, iOS 8.0, *)
    public static let CalendarEvent = UTType(kUTTypeCalendarEvent as String)
    
    /// e-mail message
    ///
    /// UTI: public.email-message
    ///
    /// conforms to: public.message
    @available(OSX 10.10, iOS 8.0, *)
    public static let EmailMessage = UTType(kUTTypeEmailMessage as String)

    /// base type for Apple Internet locations
    ///
    /// UTI: com.apple.internet-location
    ///
    /// conforms to: public.data
    @available(OSX 10.10, iOS 8.0, *)
    public static let InternetLocation = UTType(kUTTypeInternetLocation as String)

    /// Opaque InkText data
    ///
    /// UTI: com.apple.ink.inktext
    ///
    /// conforms to: public.data
    public static let InkText = UTType(kUTTypeInkText as String)
    
    /// base type for fonts
    ///
    /// UTI: public.font
    @available(OSX 10.10, iOS 8.0, *)
    public static let Font = UTType(kUTTypeFont as String)
    
    /// bookmark
    ///
    /// UTI: public.bookmark
    @available(OSX 10.10, iOS 8.0, *)
    public static let Bookmark = UTType(kUTTypeBookmark as String)
    
    /// base type for 3D content
    ///
    /// UTI: public.3d-content
    ///
    /// conforms to: public.content
    @available(OSX 10.10, iOS 8.0, *)
    public static let Any3DContent = UTType(kUTType3DContent as String)
    
    /// PKCS#12 format
    ///
    /// UTI: com.rsa.pkcs-12
    ///
    /// conforms to: public.data
    @available(OSX 10.10, iOS 8.0, *)
    public static let PKCS12 = UTType(kUTTypePKCS12 as String)
    
    /// X.509 certificate format
    ///
    /// UTI: public.x509-certificate
    ///
    /// conforms to: public.data
    @available(OSX 10.10, iOS 8.0, *)
    public static let X509Certificate = UTType(kUTTypeX509Certificate as String)
    
    /// ePub format
    ///
    /// UTI: org.idpf.epub-container
    ///
    /// conforms to: public.data, public.composite-content
    @available(OSX 10.10, iOS 8.0, *)
    public static let ElectronicPublication = UTType(kUTTypeElectronicPublication as String)
    
    /// console log
    ///
    /// UTI: public.log
    @available(OSX 10.10, iOS 8.0, *)
    public static let Log = UTType(kUTTypeLog as String)

}

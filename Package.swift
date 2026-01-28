// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenFreeType",
    products: [
        .library(
            name: "OpenFreeType",
            targets: ["OpenFreeType"]
        ),
        .library(
            name: "OpenHarfBuzz",
            targets: ["OpenHarfBuzz"]
        )
    ],
    targets: [
        .target(
            name: "OpenFreeType",
            path: "Sources/OpenFreeType",
            exclude: [
                // ============================================================
                // FreeType uses "single object compilation" (amalgamation).
                // Each module has a "driver" file (e.g., autofit.c) that
                // #includes all other .c files in that module.
                // We must exclude the individual files to avoid duplicate symbols.
                // ============================================================

                // --- autofit/ (driver: autofit.c) ---
                "autofit/ft-hb.c",
                "autofit/ft-hb-ft.c",
                "autofit/afadjust.c",
                "autofit/afblue.c",
                "autofit/afcjk.c",
                "autofit/afdummy.c",
                "autofit/afglobal.c",
                "autofit/afgsub.c",
                "autofit/afhints.c",
                "autofit/afindic.c",
                "autofit/aflatin.c",
                "autofit/afloader.c",
                "autofit/afmodule.c",
                "autofit/afranges.c",
                "autofit/afshaper.c",

                // --- base/ (driver: ftbase.c) ---
                "base/ftadvanc.c",
                "base/ftcalc.c",
                "base/ftcolor.c",
                "base/ftdbgmem.c",
                "base/fterrors.c",
                "base/ftfntfmt.c",
                "base/ftgloadr.c",
                "base/fthash.c",
                "base/ftlcdfil.c",
                "base/ftmac.c",
                "base/ftobjs.c",
                "base/ftoutln.c",
                "base/ftpsprop.c",
                "base/ftrfork.c",
                "base/ftsnames.c",
                "base/ftstream.c",
                "base/fttrigon.c",
                "base/ftutil.c",

                // --- bdf/ (driver: bdf.c) ---
                "bdf/bdflib.c",
                "bdf/bdfdrivr.c",

                // --- cache/ (driver: ftcache.c) ---
                "cache/ftcbasic.c",
                "cache/ftccache.c",
                "cache/ftccmap.c",
                "cache/ftcglyph.c",
                "cache/ftcimage.c",
                "cache/ftcmanag.c",
                "cache/ftcmru.c",
                "cache/ftcsbits.c",

                // --- cff/ (driver: cff.c) ---
                "cff/cffcmap.c",
                "cff/cffdrivr.c",
                "cff/cffgload.c",
                "cff/cffload.c",
                "cff/cffobjs.c",
                "cff/cffparse.c",

                // --- cid/ (driver: type1cid.c) ---
                "cid/cidgload.c",
                "cid/cidload.c",
                "cid/cidobjs.c",
                "cid/cidparse.c",
                "cid/cidriver.c",

                // --- gxvalid/ (driver: gxvalid.c) ---
                "gxvalid/gxvbsln.c",
                "gxvalid/gxvcommn.c",
                "gxvalid/gxvfeat.c",
                "gxvalid/gxvfgen.c",  // Also a standalone code generator
                "gxvalid/gxvjust.c",
                "gxvalid/gxvkern.c",
                "gxvalid/gxvlcar.c",
                "gxvalid/gxvmod.c",
                "gxvalid/gxvmort.c",
                "gxvalid/gxvmort0.c",
                "gxvalid/gxvmort1.c",
                "gxvalid/gxvmort2.c",
                "gxvalid/gxvmort4.c",
                "gxvalid/gxvmort5.c",
                "gxvalid/gxvmorx.c",
                "gxvalid/gxvmorx0.c",
                "gxvalid/gxvmorx1.c",
                "gxvalid/gxvmorx2.c",
                "gxvalid/gxvmorx4.c",
                "gxvalid/gxvmorx5.c",
                "gxvalid/gxvopbd.c",
                "gxvalid/gxvprop.c",
                "gxvalid/gxvtrak.c",

                // --- gzip/ (driver: ftgzip.c) ---
                // These are #include'd by ftgzip.c with specific macros
                "gzip/adler32.c",
                "gzip/crc32.c",
                "gzip/inffast.c",
                "gzip/inflate.c",
                "gzip/inftrees.c",
                "gzip/zutil.c",

                // --- lzw/ (driver: ftlzw.c) ---
                "lzw/ftzopen.c",

                // --- otvalid/ (driver: otvalid.c) ---
                "otvalid/otvbase.c",
                "otvalid/otvcommn.c",
                "otvalid/otvgdef.c",
                "otvalid/otvgpos.c",
                "otvalid/otvgsub.c",
                "otvalid/otvjstf.c",
                "otvalid/otvmath.c",
                "otvalid/otvmod.c",

                // --- pcf/ (driver: pcf.c) ---
                "pcf/pcfdrivr.c",
                "pcf/pcfread.c",
                "pcf/pcfutil.c",

                // --- pfr/ (driver: pfr.c) ---
                "pfr/pfrcmap.c",
                "pfr/pfrdrivr.c",
                "pfr/pfrgload.c",
                "pfr/pfrload.c",
                "pfr/pfrobjs.c",
                "pfr/pfrsbit.c",

                // --- psaux/ (driver: psaux.c) ---
                "psaux/afmparse.c",
                "psaux/cffdecode.c",
                "psaux/psarrst.c",
                "psaux/psauxmod.c",
                "psaux/psblues.c",
                "psaux/psconv.c",
                "psaux/pserror.c",
                "psaux/psfont.c",
                "psaux/psft.c",
                "psaux/pshints.c",
                "psaux/psintrp.c",
                "psaux/psobjs.c",
                "psaux/psread.c",
                "psaux/psstack.c",
                "psaux/t1cmap.c",
                "psaux/t1decode.c",

                // --- pshinter/ (driver: pshinter.c) ---
                "pshinter/pshalgo.c",
                "pshinter/pshglob.c",
                "pshinter/pshmod.c",
                "pshinter/pshrec.c",

                // --- psnames/ (driver: psnames.c) ---
                "psnames/psmodule.c",

                // --- raster/ (driver: raster.c) ---
                "raster/ftraster.c",
                "raster/ftrend1.c",

                // --- sdf/ (driver: sdf.c) ---
                "sdf/ftbsdf.c",
                "sdf/ftsdf.c",
                "sdf/ftsdfcommon.c",
                "sdf/ftsdfrend.c",

                // --- sfnt/ (driver: sfnt.c) ---
                "sfnt/pngshim.c",
                "sfnt/sfdriver.c",
                "sfnt/sfobjs.c",
                "sfnt/sfwoff.c",
                "sfnt/sfwoff2.c",
                "sfnt/ttbdf.c",
                "sfnt/ttcmap.c",
                "sfnt/ttcolr.c",
                "sfnt/ttcpal.c",
                "sfnt/ttgpos.c",
                "sfnt/ttkern.c",
                "sfnt/ttload.c",
                "sfnt/ttmtx.c",
                "sfnt/ttpost.c",
                "sfnt/ttsbit.c",
                "sfnt/ttsvg.c",
                "sfnt/woff2tags.c",

                // --- smooth/ (driver: smooth.c) ---
                "smooth/ftgrays.c",
                "smooth/ftsmooth.c",

                // --- svg/ (driver: svg.c) ---
                "svg/ftsvg.c",

                // --- truetype/ (driver: truetype.c) ---
                "truetype/ttdriver.c",
                "truetype/ttgload.c",
                "truetype/ttgxvar.c",
                "truetype/ttinterp.c",
                "truetype/ttobjs.c",
                "truetype/ttpload.c",

                // --- type1/ (driver: type1.c) ---
                "type1/t1afm.c",
                "type1/t1driver.c",
                "type1/t1gload.c",
                "type1/t1load.c",
                "type1/t1objs.c",
                "type1/t1parse.c",

                // --- type42/ (driver: type42.c) ---
                "type42/t42drivr.c",
                "type42/t42objs.c",
                "type42/t42parse.c",
            ],
            publicHeadersPath: "include",
            cSettings: [
                // FreeType expects to be built with this define for internal compilation;
                // otherwise `fterrors.h` undefines `FT_ERR_PREFIX` and the build fails.
                .define("FT2_BUILD_LIBRARY"),
                .define("_CRT_SECURE_NO_WARNINGS"),
                .headerSearchPath("include"),
            ]
        ),
        .target(
            name: "OpenHarfBuzz",
            dependencies: ["OpenFreeType"],
            path: "Sources/OpenHarfBuzz",
            exclude: [
                // ============================================================
                // HarfBuzz uses "single object compilation" (amalgamation).
                // The harfbuzz.cc file #includes all other .cc files.
                // We must exclude the individual files to avoid duplicate symbols.
                // ============================================================

                // --- Files included by harfbuzz.cc (amalgamation) ---
                "OT/Var/VARC/VARC.cc",
                "hb-aat-layout.cc",
                "hb-aat-map.cc",
                "hb-blob.cc",
                "hb-buffer-serialize.cc",
                "hb-buffer-verify.cc",
                "hb-buffer.cc",
                "hb-common.cc",
                "hb-coretext-font.cc",
                "hb-coretext-shape.cc",
                "hb-coretext.cc",
                "hb-directwrite-font.cc",
                "hb-directwrite-shape.cc",
                "hb-directwrite.cc",
                "hb-draw.cc",
                "hb-face-builder.cc",
                "hb-face.cc",
                "hb-fallback-shape.cc",
                "hb-font.cc",
                "hb-ft.cc",
                "hb-gdi.cc",
                "hb-glib.cc",
                "hb-graphite2.cc",
                "hb-map.cc",
                "hb-number.cc",
                "hb-ot-cff1-table.cc",
                "hb-ot-cff2-table.cc",
                "hb-ot-color.cc",
                "hb-ot-face.cc",
                "hb-ot-font.cc",
                "hb-ot-layout.cc",
                "hb-ot-map.cc",
                "hb-ot-math.cc",
                "hb-ot-meta.cc",
                "hb-ot-metrics.cc",
                "hb-ot-name.cc",
                "hb-ot-shape-fallback.cc",
                "hb-ot-shape-normalize.cc",
                "hb-ot-shape.cc",
                "hb-ot-shaper-arabic.cc",
                "hb-ot-shaper-default.cc",
                "hb-ot-shaper-hangul.cc",
                "hb-ot-shaper-hebrew.cc",
                "hb-ot-shaper-indic-table.cc",
                "hb-ot-shaper-indic.cc",
                "hb-ot-shaper-khmer.cc",
                "hb-ot-shaper-myanmar.cc",
                "hb-ot-shaper-syllabic.cc",
                "hb-ot-shaper-thai.cc",
                "hb-ot-shaper-use.cc",
                "hb-ot-shaper-vowel-constraints.cc",
                "hb-ot-tag.cc",
                "hb-ot-var.cc",
                "hb-outline.cc",
                "hb-paint-bounded.cc",
                "hb-paint-extents.cc",
                "hb-paint.cc",
                "hb-set.cc",
                "hb-shape-plan.cc",
                "hb-shape.cc",
                "hb-shaper.cc",
                "hb-static.cc",
                "hb-style.cc",
                "hb-ucd.cc",
                "hb-unicode.cc",
                "hb-uniscribe.cc",
                "hb-wasm-api.cc",
                "hb-wasm-shape.cc",

                // --- Subset amalgamation (not needed for core library) ---
                "harfbuzz-subset.cc",
                "hb-subset.cc",
                "hb-subset-cff-common.cc",
                "hb-subset-cff1.cc",
                "hb-subset-cff2.cc",
                "hb-subset-input.cc",
                "hb-subset-instancer-iup.cc",
                "hb-subset-instancer-solver.cc",
                "hb-subset-plan.cc",
                "hb-subset-plan-layout.cc",
                "hb-subset-plan-var.cc",
                "hb-subset-serialize.cc",
                "hb-subset-table-cff.cc",
                "hb-subset-table-color.cc",
                "hb-subset-table-layout.cc",
                "hb-subset-table-other.cc",
                "hb-subset-table-var.cc",

                // --- Optional backends not needed ---
                "hb-cairo.cc",
                "hb-cairo-utils.cc",
                "hb-gobject-structs.cc",
                "hb-harfrust.cc",
                "hb-icu.cc",
                "hb-kbts.cc",

                // --- Test files ---
                "main.cc",
                "test.cc",
                "test-algs.cc",
                "test-array.cc",
                "test-bimap.cc",
                "test-buffer-serialize.cc",
                "test-cff.cc",
                "test-decycler.cc",
                "test-gpos-size-params.cc",
                "test-gsub-get-alternates.cc",
                "test-gsub-would-substitute.cc",
                "test-item-varstore.cc",
                "test-iter.cc",
                "test-machinery.cc",
                "test-map.cc",
                "test-multimap.cc",
                "test-number.cc",
                "test-ot-glyphname.cc",
                "test-ot-meta.cc",
                "test-ot-name.cc",
                "test-priority-queue.cc",
                "test-repacker.cc",
                "test-serialize.cc",
                "test-set.cc",
                "test-subset-instancer-solver.cc",
                "test-tuple-varstore.cc",
                "test-unicode-ranges.cc",
                "test-use-table.cc",
                "test-vector.cc",
                "failing-alloc.c",
            ],
            sources: ["harfbuzz.cc"],
            publicHeadersPath: "include",
            cxxSettings: [
                .headerSearchPath("."),
                .define("HAVE_FREETYPE", to: "1"),
                .define("_CRT_SECURE_NO_WARNINGS")
                // Uncomment below for CoreText support on Apple platforms
                // .define("HAVE_CORETEXT", to: "1", .when(platforms: [.macOS, .iOS, .tvOS, .watchOS, .visionOS])),
            ]
        ),
        .testTarget(
            name: "OpenFreeTypeTests",
            dependencies: ["OpenFreeType"]
        )
    ]
)

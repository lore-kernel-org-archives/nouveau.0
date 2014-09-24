From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 2/2] kepler: remove unnecessary texbars,
	add live-only tex for nvf0
Date: Tue, 23 Sep 2014 23:56:11 -0400
Message-ID: <1411530971-3381-2-git-send-email-imirkin@alum.mit.edu>
References: <1411530971-3381-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1411530971-3381-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Noticed the texbars when looking at maxwell stuff, and nvf0 wouldn't
even compile without the new flags, which I made to match the nve0
versions.

Untested.

 src/shader/exac8nvf0.fp  | 4 ++--
 src/shader/exac8nvf0.fpc | 4 ++--
 src/shader/exacanve0.fp  | 1 -
 src/shader/exacanve0.fpc | 2 --
 src/shader/exacanvf0.fp  | 5 ++---
 src/shader/exacanvf0.fpc | 6 ++----
 src/shader/exacmnve0.fp  | 1 -
 src/shader/exacmnve0.fpc | 2 --
 src/shader/exacmnvf0.fp  | 5 ++---
 src/shader/exacmnvf0.fpc | 6 ++----
 src/shader/exas8nvf0.fp  | 2 +-
 src/shader/exas8nvf0.fpc | 2 +-
 src/shader/exasanve0.fp  | 1 -
 src/shader/exasanve0.fpc | 2 --
 src/shader/exasanvf0.fp  | 5 ++---
 src/shader/exasanvf0.fpc | 6 ++----
 src/shader/exascnvf0.fp  | 2 +-
 src/shader/exascnvf0.fpc | 2 +-
 src/shader/videonvf0.fp  | 4 ++--
 src/shader/videonvf0.fpc | 4 ++--
 20 files changed, 24 insertions(+), 42 deletions(-)

diff --git a/src/shader/exac8nvf0.fp b/src/shader/exac8nvf0.fp
index e4a7b04..f1c7fed 100644
--- a/src/shader/exac8nvf0.fp
+++ b/src/shader/exac8nvf0.fp
@@ -29,10 +29,10 @@ interp pass f32 $r0 a[0x7c] 0x0 0x0 0x0
 rcp f32 $r0 $r0
 interp mul f32 $r3 a[0x94] $r0 0x0 0x0
 interp mul f32 $r2 a[0x90] $r0 0x0 0x0
-tex t lauto #:#:#:$r1 t2d c[0x4] xy__ $r2:$r3 0x0
+tex t lauto live dfp #:#:#:$r1 t2d c[0x4] xy__ $r2:$r3 0x0
 interp mul f32 $r3 a[0x84] $r0 0x0 0x0
 interp mul f32 $r2 a[0x80] $r0 0x0 0x0
-tex t lauto #:#:#:$r0 t2d c[0x0] xy__ $r2:$r3 0x0
+tex t lauto live dfp #:#:#:$r0 t2d c[0x0] xy__ $r2:$r3 0x0
 texbar 0x0
 mul ftz rn f32 $r3 $r0 $r1
 mov b32 $r2 $r3
diff --git a/src/shader/exac8nvf0.fpc b/src/shader/exac8nvf0.fpc
index 465cabf..7cfecb5 100644
--- a/src/shader/exac8nvf0.fpc
+++ b/src/shader/exac8nvf0.fpc
@@ -6,13 +6,13 @@
 0x74a3fc4a,
 0x001ffc0a,
 0x74a3fc48,
-0x7f9c0805,
+0xff9c0805,
 0x600080a1,
 0x001ffc0e,
 0x74a3fc42,
 0x001ffc0a,
 0x74a3fc40,
-0x7f9c0801,
+0xff9c0801,
 0x600000a1,
 0x001c0002,
 0x77000000,
diff --git a/src/shader/exacanve0.fp b/src/shader/exacanve0.fp
index edeb717..3928b6d 100644
--- a/src/shader/exacanve0.fp
+++ b/src/shader/exacanve0.fp
@@ -30,7 +30,6 @@ rcp f32 $r0 $r0
 interp mul f32 $r3 a[0x94] $r0 0x0
 interp mul f32 $r2 a[0x90] $r0 0x0
 tex t lauto live dfp $r4:$r5:$r6:$r7 t2d $t1 $s0 $r2:$r3 ()
-texbar 0x0
 interp mul f32 $r1 a[0x84] $r0 0x0
 interp mul f32 $r0 a[0x80] $r0 0x0
 tex t lauto live dfp $r0:$r1:$r2:$r3 t2d $t0 $s0 $r0:$r1 ()
diff --git a/src/shader/exacanve0.fpc b/src/shader/exacanve0.fpc
index a8320f0..fa96dae 100644
--- a/src/shader/exacanve0.fpc
+++ b/src/shader/exacanve0.fpc
@@ -8,8 +8,6 @@
 0xc07e0090,
 0x00211e86,
 0x8013c001,
-0x00001de6,
-0xf0000000,
 0x03f05c40,
 0xc07e0084,
 0x03f01c40,
diff --git a/src/shader/exacanvf0.fp b/src/shader/exacanvf0.fp
index 338a1e1..dddc22e 100644
--- a/src/shader/exacanvf0.fp
+++ b/src/shader/exacanvf0.fp
@@ -29,11 +29,10 @@ interp pass f32 $r0 a[0x7c] 0x0 0x0 0x0
 rcp f32 $r0 $r0
 interp mul f32 $r3 a[0x94] $r0 0x0 0x0
 interp mul f32 $r2 a[0x90] $r0 0x0 0x0
-tex t lauto $r4:$r5:$r6:$r7 t2d c[0x4] xy__ $r2:$r3 0x0
-texbar 0x0
+tex t lauto live dfp $r4:$r5:$r6:$r7 t2d c[0x4] xy__ $r2:$r3 0x0
 interp mul f32 $r1 a[0x84] $r0 0x0 0x0
 interp mul f32 $r0 a[0x80] $r0 0x0 0x0
-tex t lauto $r0:$r1:$r2:$r3 t2d c[0x0] xy__ $r0:$r1 0x0
+tex t lauto live dfp $r0:$r1:$r2:$r3 t2d c[0x0] xy__ $r0:$r1 0x0
 texbar 0x0
 mul ftz rn f32 $r3 $r3 $r7
 mul ftz rn f32 $r2 $r2 $r6
diff --git a/src/shader/exacanvf0.fpc b/src/shader/exacanvf0.fpc
index 70dd4b1..793f15c 100644
--- a/src/shader/exacanvf0.fpc
+++ b/src/shader/exacanvf0.fpc
@@ -6,15 +6,13 @@
 0x74a3fc4a,
 0x001ffc0a,
 0x74a3fc48,
-0x7f9c0811,
+0xff9c0811,
 0x600080bd,
-0x001c0002,
-0x77000000,
 0x001ffc06,
 0x74a3fc42,
 0x001ffc02,
 0x74a3fc40,
-0x7f9c0001,
+0xff9c0001,
 0x600000bd,
 0x001c0002,
 0x77000000,
diff --git a/src/shader/exacmnve0.fp b/src/shader/exacmnve0.fp
index 09d22c1..71895f4 100644
--- a/src/shader/exacmnve0.fp
+++ b/src/shader/exacmnve0.fp
@@ -30,7 +30,6 @@ rcp f32 $r0 $r0
 interp mul f32 $r3 a[0x94] $r0 0x0
 interp mul f32 $r2 a[0x90] $r0 0x0
 tex t lauto live dfp #:#:#:$r4 t2d $t1 $s0 $r2:$r3 ()
-texbar 0x0
 interp mul f32 $r1 a[0x84] $r0 0x0
 interp mul f32 $r0 a[0x80] $r0 0x0
 tex t lauto live dfp $r0:$r1:$r2:$r3 t2d $t0 $s0 $r0:$r1 ()
diff --git a/src/shader/exacmnve0.fpc b/src/shader/exacmnve0.fpc
index 5c2d4bf..2c256b1 100644
--- a/src/shader/exacmnve0.fpc
+++ b/src/shader/exacmnve0.fpc
@@ -8,8 +8,6 @@
 0xc07e0090,
 0x00211e86,
 0x80120001,
-0x00001de6,
-0xf0000000,
 0x03f05c40,
 0xc07e0084,
 0x03f01c40,
diff --git a/src/shader/exacmnvf0.fp b/src/shader/exacmnvf0.fp
index 787b4f5..e52b7bd 100644
--- a/src/shader/exacmnvf0.fp
+++ b/src/shader/exacmnvf0.fp
@@ -29,11 +29,10 @@ interp pass f32 $r0 a[0x7c] 0x0 0x0 0x0
 rcp f32 $r0 $r0
 interp mul f32 $r3 a[0x94] $r0 0x0 0x0
 interp mul f32 $r2 a[0x90] $r0 0x0 0x0
-tex t lauto #:#:#:$r4 t2d c[0x4] xy__ $r2:$r3 0x0
-texbar 0x0
+tex t lauto live dfp #:#:#:$r4 t2d c[0x4] xy__ $r2:$r3 0x0
 interp mul f32 $r1 a[0x84] $r0 0x0 0x0
 interp mul f32 $r0 a[0x80] $r0 0x0 0x0
-tex t lauto $r0:$r1:$r2:$r3 t2d c[0x0] xy__ $r0:$r1 0x0
+tex t lauto live dfp $r0:$r1:$r2:$r3 t2d c[0x0] xy__ $r0:$r1 0x0
 texbar 0x0
 mul ftz rn f32 $r3 $r3 $r4
 mul ftz rn f32 $r2 $r2 $r4
diff --git a/src/shader/exacmnvf0.fpc b/src/shader/exacmnvf0.fpc
index b2acf6f..4ec8a33 100644
--- a/src/shader/exacmnvf0.fpc
+++ b/src/shader/exacmnvf0.fpc
@@ -6,15 +6,13 @@
 0x74a3fc4a,
 0x001ffc0a,
 0x74a3fc48,
-0x7f9c0811,
+0xff9c0811,
 0x600080a1,
-0x001c0002,
-0x77000000,
 0x001ffc06,
 0x74a3fc42,
 0x001ffc02,
 0x74a3fc40,
-0x7f9c0001,
+0xff9c0001,
 0x600000bd,
 0x001c0002,
 0x77000000,
diff --git a/src/shader/exas8nvf0.fp b/src/shader/exas8nvf0.fp
index 3804b27..245262c 100644
--- a/src/shader/exas8nvf0.fp
+++ b/src/shader/exas8nvf0.fp
@@ -29,7 +29,7 @@ interp pass f32 $r0 a[0x7c] 0x0 0x0 0x0
 rcp f32 $r0 $r0
 interp mul f32 $r1 a[0x84] $r0 0x0 0x0
 interp mul f32 $r0 a[0x80] $r0 0x0 0x0
-tex t lauto #:#:#:$r0 t2d c[0x0] xy__ $r0:$r1 0x0
+tex t lauto live dfp #:#:#:$r0 t2d c[0x0] xy__ $r0:$r1 0x0
 texbar 0x0
 mov b32 $r3 $r0
 mov b32 $r2 $r0
diff --git a/src/shader/exas8nvf0.fpc b/src/shader/exas8nvf0.fpc
index 4ec3bb7..a59ffe6 100644
--- a/src/shader/exas8nvf0.fpc
+++ b/src/shader/exas8nvf0.fpc
@@ -6,7 +6,7 @@
 0x74a3fc42,
 0x001ffc02,
 0x74a3fc40,
-0x7f9c0001,
+0xff9c0001,
 0x600000a1,
 0x001c0002,
 0x77000000,
diff --git a/src/shader/exasanve0.fp b/src/shader/exasanve0.fp
index dea8eab..8ddcc4a 100644
--- a/src/shader/exasanve0.fp
+++ b/src/shader/exasanve0.fp
@@ -30,7 +30,6 @@ rcp f32 $r0 $r0
 interp mul f32 $r3 a[0x84] $r0 0x0
 interp mul f32 $r2 a[0x80] $r0 0x0
 tex t lauto live dfp #:#:#:$r4 t2d $t0 $s0 $r2:$r3 ()
-texbar 0x0
 interp mul f32 $r1 a[0x94] $r0 0x0
 interp mul f32 $r0 a[0x90] $r0 0x0
 tex t lauto live dfp $r0:$r1:$r2:$r3 t2d $t1 $s0 $r0:$r1 ()
diff --git a/src/shader/exasanve0.fpc b/src/shader/exasanve0.fpc
index efc701e..170c5df 100644
--- a/src/shader/exasanve0.fpc
+++ b/src/shader/exasanve0.fpc
@@ -8,8 +8,6 @@
 0xc07e0080,
 0x00211e86,
 0x80120000,
-0x00001de6,
-0xf0000000,
 0x03f05c40,
 0xc07e0094,
 0x03f01c40,
diff --git a/src/shader/exasanvf0.fp b/src/shader/exasanvf0.fp
index 8175f9b..c5c60a3 100644
--- a/src/shader/exasanvf0.fp
+++ b/src/shader/exasanvf0.fp
@@ -29,11 +29,10 @@ interp pass f32 $r0 a[0x7c] 0x0 0x0 0x0
 rcp f32 $r0 $r0
 interp mul f32 $r3 a[0x84] $r0 0x0 0x0
 interp mul f32 $r2 a[0x80] $r0 0x0 0x0
-tex t lauto #:#:#:$r4 t2d c[0x0] xy__ $r2:$r3 0x0
-texbar 0x0
+tex t lauto live dfp #:#:#:$r4 t2d c[0x0] xy__ $r2:$r3 0x0
 interp mul f32 $r1 a[0x94] $r0 0x0 0x0
 interp mul f32 $r0 a[0x90] $r0 0x0 0x0
-tex t lauto $r0:$r1:$r2:$r3 t2d c[0x4] xy__ $r0:$r1 0x0
+tex t lauto live dfp $r0:$r1:$r2:$r3 t2d c[0x4] xy__ $r0:$r1 0x0
 texbar 0x0
 mul ftz rn f32 $r3 $r3 $r4
 mul ftz rn f32 $r2 $r2 $r4
diff --git a/src/shader/exasanvf0.fpc b/src/shader/exasanvf0.fpc
index 6e68d98..afddc84 100644
--- a/src/shader/exasanvf0.fpc
+++ b/src/shader/exasanvf0.fpc
@@ -6,15 +6,13 @@
 0x74a3fc42,
 0x001ffc0a,
 0x74a3fc40,
-0x7f9c0811,
+0xff9c0811,
 0x600000a1,
-0x001c0002,
-0x77000000,
 0x001ffc06,
 0x74a3fc4a,
 0x001ffc02,
 0x74a3fc48,
-0x7f9c0001,
+0xff9c0001,
 0x600080bd,
 0x001c0002,
 0x77000000,
diff --git a/src/shader/exascnvf0.fp b/src/shader/exascnvf0.fp
index e56c27f..447c67d 100644
--- a/src/shader/exascnvf0.fp
+++ b/src/shader/exascnvf0.fp
@@ -29,7 +29,7 @@ interp pass f32 $r0 a[0x7c] 0x0 0x0 0x0
 rcp f32 $r0 $r0
 interp mul f32 $r1 a[0x84] $r0 0x0 0x0
 interp mul f32 $r0 a[0x80] $r0 0x0 0x0
-tex t lauto $r0:$r1:$r2:$r3 t2d c[0x0] xy__ $r0:$r1 0x0
+tex t lauto live dfp $r0:$r1:$r2:$r3 t2d c[0x0] xy__ $r0:$r1 0x0
 texbar 0x0
 exit
 #endif
diff --git a/src/shader/exascnvf0.fpc b/src/shader/exascnvf0.fpc
index 53af859..5d2dce6 100644
--- a/src/shader/exascnvf0.fpc
+++ b/src/shader/exascnvf0.fpc
@@ -6,7 +6,7 @@
 0x74a3fc42,
 0x001ffc02,
 0x74a3fc40,
-0x7f9c0001,
+0xff9c0001,
 0x600000bd,
 0x001c0002,
 0x77000000,
diff --git a/src/shader/videonvf0.fp b/src/shader/videonvf0.fp
index a684203..3612dcd 100644
--- a/src/shader/videonvf0.fp
+++ b/src/shader/videonvf0.fp
@@ -29,8 +29,8 @@ interp pass f32 $r2 a[0x7c] 0x0 0x0 0x0
 rcp f32 $r2 $r2
 interp mul f32 $r0 a[0x80] $r2 0x0 0x0
 interp mul f32 $r1 a[0x84] $r2 0x0 0x0
-tex t lauto #:#:#:$r4 t2d c[0x0] xy__ $r0:$r1 0x0
-tex p lauto #:#:$r0:$r1 t2d c[0x4] xy__ $r0:$r1 0x0
+tex t lauto live dfp #:#:#:$r4 t2d c[0x0] xy__ $r0:$r1 0x0
+tex p lauto live dfp #:#:$r0:$r1 t2d c[0x4] xy__ $r0:$r1 0x0
 texbar 0x1
 mul ftz rn f32 $r5 $r4 c0[0x0]
 add ftz rn f32 $r3 $r5 c0[0x4]
diff --git a/src/shader/videonvf0.fpc b/src/shader/videonvf0.fpc
index c545967..a7e5e98 100644
--- a/src/shader/videonvf0.fpc
+++ b/src/shader/videonvf0.fpc
@@ -6,9 +6,9 @@
 0x74a3fc40,
 0x011ffc06,
 0x74a3fc42,
-0x7f9c0011,
+0xff9c0011,
 0x600000a1,
-0x7f9c0001,
+0xff9c0001,
 0x600080b2,
 0x009c0002,
 0x77000000,
-- 
1.8.5.5

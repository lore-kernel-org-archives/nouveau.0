From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Unused macros in DRM
Date: Sat, 23 Jun 2007 01:03:33 +0300
Message-ID: <20070623010333.06623c82@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_cnR/CUVHa/akL/78FSbfPWi"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--MP_cnR/CUVHa/akL/78FSbfPWi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey,

I got bored and as I heard that the DDX register header file might
contain unused leftover macros, I decided to clean it up. Except that
when I was done, I realized I had poked the DRM register header file.
Oh well...

Here is attached a patch which is not intended to be applied. It just
shows what macros are unused in DRM nouveau_reg.h. nouveau.o still
compiles, but I have not tested if it runs.

Have fun, I'm going to sleep. Apparently I need it.

-- 
Pekka "PQ" Paalanen
http://www.iki.fi/pq/

--MP_cnR/CUVHa/akL/78FSbfPWi
Content-Type: text/x-patch;
 name=0001-Commented-out-all-macros-that-are-not-used-it-stil.patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0001-Commented-out-all-macros-that-are-not-used-it-stil.patch

From aa653653e8d11c8d0fe01de1a31cdab16728adb1 Mon Sep 17 00:00:00 2001
From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Date: Sat, 23 Jun 2007 00:53:15 +0300
Subject: [PATCH] Commented out all macros that are not used - it still compiles.

But does it work?
---
 shared-core/nouveau_reg.h |  248 ++++++++++++++++++++++----------------------
 1 files changed, 124 insertions(+), 124 deletions(-)

diff --git a/shared-core/nouveau_reg.h b/shared-core/nouveau_reg.h
index ea4a2f6..e2b3012 100644
--- a/shared-core/nouveau_reg.h
+++ b/shared-core/nouveau_reg.h
@@ -25,14 +25,14 @@
 #    define NV_RAMHT_CONTEXT_VALID                         (1<<31)
 #    define NV_RAMHT_CONTEXT_CHANNEL_SHIFT                 24
 #    define NV_RAMHT_CONTEXT_ENGINE_SHIFT                  16
-#        define NV_RAMHT_CONTEXT_ENGINE_SOFTWARE           0
-#        define NV_RAMHT_CONTEXT_ENGINE_GRAPHICS           1
-#    define NV_RAMHT_CONTEXT_INSTANCE_SHIFT                0
+// #        define NV_RAMHT_CONTEXT_ENGINE_SOFTWARE           0
+// #        define NV_RAMHT_CONTEXT_ENGINE_GRAPHICS           1
+// #    define NV_RAMHT_CONTEXT_INSTANCE_SHIFT                0
 #    define NV40_RAMHT_CONTEXT_CHANNEL_SHIFT               23
 #    define NV40_RAMHT_CONTEXT_ENGINE_SHIFT                20
-#    define NV40_RAMHT_CONTEXT_INSTANCE_SHIFT              0
+// #    define NV40_RAMHT_CONTEXT_INSTANCE_SHIFT              0
 
-/* DMA object defines */
+// /* DMA object defines */
 #define NV_DMA_ACCESS_RW 0
 #define NV_DMA_ACCESS_RO 1
 #define NV_DMA_ACCESS_WO 2
@@ -40,7 +40,7 @@
 #define NV_DMA_TARGET_PCI    2
 #define NV_DMA_TARGET_AGP    3
 
-/* Some object classes we care about in the drm */
+// /* Some object classes we care about in the drm */
 #define NV_CLASS_DMA_FROM_MEMORY                           0x00000002
 #define NV_CLASS_DMA_TO_MEMORY                             0x00000003
 #define NV_CLASS_NULL                                      0x00000030
@@ -57,8 +57,8 @@
 #define NV03_PMC_INTR_0                                    0x00000100
 #    define NV_PMC_INTR_0_PFIFO_PENDING                       (1<< 8)
 #    define NV_PMC_INTR_0_PGRAPH_PENDING                      (1<<12)
-#    define NV_PMC_INTR_0_CRTC0_PENDING                       (1<<24)
-#    define NV_PMC_INTR_0_CRTC1_PENDING                       (1<<25)
+// #    define NV_PMC_INTR_0_CRTC0_PENDING                       (1<<24)
+// #    define NV_PMC_INTR_0_CRTC1_PENDING                       (1<<25)
 #    define NV_PMC_INTR_0_CRTCn_PENDING                       (3<<24)
 #define NV03_PMC_INTR_EN_0                                 0x00000140
 #    define NV_PMC_INTR_EN_0_MASTER_ENABLE                    (1<< 0)
@@ -68,7 +68,7 @@
 /* Disabling the below bit breaks newer (G7X only?) mobile chipsets,
  * the card will hang early on in the X init process.
  */
-#    define NV_PMC_ENABLE_UNK13                               (1<<13)
+// #    define NV_PMC_ENABLE_UNK13                               (1<<13)
 #define NV40_PMC_1700                                      0x00001700
 #define NV40_PMC_1704                                      0x00001704
 #define NV40_PMC_1708                                      0x00001708
@@ -78,9 +78,9 @@
 #define NV04_PTIMER_INTR_EN_0                              0x00009140
 #define NV04_PTIMER_NUMERATOR                              0x00009200
 #define NV04_PTIMER_DENOMINATOR                            0x00009210
-#define NV04_PTIMER_TIME_0                                 0x00009400
-#define NV04_PTIMER_TIME_1                                 0x00009410
-#define NV04_PTIMER_ALARM_0                                0x00009420
+// #define NV04_PTIMER_TIME_0                                 0x00009400
+// #define NV04_PTIMER_TIME_1                                 0x00009410
+// #define NV04_PTIMER_ALARM_0                                0x00009420
 
 #define NV04_PFB_CFG0                                      0x00100200
 #define NV04_PFB_CFG1                                      0x00100204
@@ -127,8 +127,8 @@
 #define NV04_PGRAPH_CTX_USER                               0x00400174
 #define NV04_PGRAPH_CTX_CACHE1                             0x00400180
 #define NV10_PGRAPH_CTX_CACHE2                             0x00400180
-#define NV03_PGRAPH_CTX_CONTROL                            0x00400190
-#define NV03_PGRAPH_CTX_USER                               0x00400194
+// #define NV03_PGRAPH_CTX_CONTROL                            0x00400190
+// #define NV03_PGRAPH_CTX_USER                               0x00400194
 #define NV04_PGRAPH_CTX_CACHE2                             0x004001A0
 #define NV10_PGRAPH_CTX_CACHE3                             0x004001A0
 #define NV04_PGRAPH_CTX_CACHE3                             0x004001C0
@@ -168,21 +168,21 @@
 #define NV04_PGRAPH_PASSTHRU_2                             0x00400584
 #define NV10_PGRAPH_DIMX_TEXTURE                           0x00400588
 #define NV10_PGRAPH_WDIMX_TEXTURE                          0x0040058C
-#define NV04_PGRAPH_COMBINE_0_ALPHA                        0x00400590
-#define NV04_PGRAPH_COMBINE_0_COLOR                        0x00400594
-#define NV04_PGRAPH_COMBINE_1_ALPHA                        0x00400598
-#define NV04_PGRAPH_COMBINE_1_COLOR                        0x0040059C
-#define NV04_PGRAPH_FORMAT_0                               0x004005A8
-#define NV04_PGRAPH_FORMAT_1                               0x004005AC
-#define NV04_PGRAPH_FILTER_0                               0x004005B0
-#define NV04_PGRAPH_FILTER_1                               0x004005B4
+// #define NV04_PGRAPH_COMBINE_0_ALPHA                        0x00400590
+// #define NV04_PGRAPH_COMBINE_0_COLOR                        0x00400594
+// #define NV04_PGRAPH_COMBINE_1_ALPHA                        0x00400598
+// #define NV04_PGRAPH_COMBINE_1_COLOR                        0x0040059C
+// #define NV04_PGRAPH_FORMAT_0                               0x004005A8
+// #define NV04_PGRAPH_FORMAT_1                               0x004005AC
+// #define NV04_PGRAPH_FILTER_0                               0x004005B0
+// #define NV04_PGRAPH_FILTER_1                               0x004005B4
 #define NV03_PGRAPH_MONO_COLOR0                            0x00400600
 #define NV04_PGRAPH_ROP3                                   0x00400604
 #define NV04_PGRAPH_BETA_AND                               0x00400608
 #define NV04_PGRAPH_BETA_PREMULT                           0x0040060C
 #define NV04_PGRAPH_LIMIT_VIOL_PIX                         0x00400610
-#define NV04_PGRAPH_FORMATS                                0x00400618
-#define NV10_PGRAPH_DEBUG_2                                0x00400620
+// #define NV04_PGRAPH_FORMATS                                0x00400618
+// #define NV10_PGRAPH_DEBUG_2                                0x00400620
 #define NV04_PGRAPH_BOFFSET0                               0x00400640
 #define NV04_PGRAPH_BOFFSET1                               0x00400644
 #define NV04_PGRAPH_BOFFSET2                               0x00400648
@@ -250,13 +250,13 @@
 #define NV10_PGRAPH_TLIMIT(i)                              (0x00400B04 + (i*16))
 #define NV10_PGRAPH_TSIZE(i)                               (0x00400B08 + (i*16))
 #define NV10_PGRAPH_TSTATUS(i)                             (0x00400B0C + (i*16))
-#define NV04_PGRAPH_U_RAM                                  0x00400D00
+// #define NV04_PGRAPH_U_RAM                                  0x00400D00
 #define NV47_PGRAPH_TILE0(i)                               0x00400D00
 #define NV47_PGRAPH_TLIMIT0(i)                             0x00400D04
 #define NV47_PGRAPH_TSIZE0(i)                              0x00400D08
 #define NV47_PGRAPH_TSTATUS0(i)                            0x00400D0C
-#define NV04_PGRAPH_V_RAM                                  0x00400D40
-#define NV04_PGRAPH_W_RAM                                  0x00400D80
+// #define NV04_PGRAPH_V_RAM                                  0x00400D40
+// #define NV04_PGRAPH_W_RAM                                  0x00400D80
 #define NV10_PGRAPH_WINDOWCLIP_HORIZONTAL                  0x00400F00
 #define NV10_PGRAPH_WINDOWCLIP_VERTICAL                    0x00400F20
 #define NV10_PGRAPH_XFMODE0                                0x00400F40
@@ -269,27 +269,27 @@
 #define NV04_PGRAPH_DMA_START_1                            0x00401004
 #define NV04_PGRAPH_DMA_LENGTH                             0x00401008
 #define NV04_PGRAPH_DMA_MISC                               0x0040100C
-#define NV04_PGRAPH_DMA_DATA_0                             0x00401020
-#define NV04_PGRAPH_DMA_DATA_1                             0x00401024
-#define NV04_PGRAPH_DMA_RM                                 0x00401030
-#define NV04_PGRAPH_DMA_A_XLATE_INST                       0x00401040
-#define NV04_PGRAPH_DMA_A_CONTROL                          0x00401044
-#define NV04_PGRAPH_DMA_A_LIMIT                            0x00401048
-#define NV04_PGRAPH_DMA_A_TLB_PTE                          0x0040104C
-#define NV04_PGRAPH_DMA_A_TLB_TAG                          0x00401050
-#define NV04_PGRAPH_DMA_A_ADJ_OFFSET                       0x00401054
-#define NV04_PGRAPH_DMA_A_OFFSET                           0x00401058
-#define NV04_PGRAPH_DMA_A_SIZE                             0x0040105C
-#define NV04_PGRAPH_DMA_A_Y_SIZE                           0x00401060
-#define NV04_PGRAPH_DMA_B_XLATE_INST                       0x00401080
-#define NV04_PGRAPH_DMA_B_CONTROL                          0x00401084
-#define NV04_PGRAPH_DMA_B_LIMIT                            0x00401088
-#define NV04_PGRAPH_DMA_B_TLB_PTE                          0x0040108C
-#define NV04_PGRAPH_DMA_B_TLB_TAG                          0x00401090
-#define NV04_PGRAPH_DMA_B_ADJ_OFFSET                       0x00401094
-#define NV04_PGRAPH_DMA_B_OFFSET                           0x00401098
-#define NV04_PGRAPH_DMA_B_SIZE                             0x0040109C
-#define NV04_PGRAPH_DMA_B_Y_SIZE                           0x004010A0
+// #define NV04_PGRAPH_DMA_DATA_0                             0x00401020
+// #define NV04_PGRAPH_DMA_DATA_1                             0x00401024
+// #define NV04_PGRAPH_DMA_RM                                 0x00401030
+// #define NV04_PGRAPH_DMA_A_XLATE_INST                       0x00401040
+// #define NV04_PGRAPH_DMA_A_CONTROL                          0x00401044
+// #define NV04_PGRAPH_DMA_A_LIMIT                            0x00401048
+// #define NV04_PGRAPH_DMA_A_TLB_PTE                          0x0040104C
+// #define NV04_PGRAPH_DMA_A_TLB_TAG                          0x00401050
+// #define NV04_PGRAPH_DMA_A_ADJ_OFFSET                       0x00401054
+// #define NV04_PGRAPH_DMA_A_OFFSET                           0x00401058
+// #define NV04_PGRAPH_DMA_A_SIZE                             0x0040105C
+// #define NV04_PGRAPH_DMA_A_Y_SIZE                           0x00401060
+// #define NV04_PGRAPH_DMA_B_XLATE_INST                       0x00401080
+// #define NV04_PGRAPH_DMA_B_CONTROL                          0x00401084
+// #define NV04_PGRAPH_DMA_B_LIMIT                            0x00401088
+// #define NV04_PGRAPH_DMA_B_TLB_PTE                          0x0040108C
+// #define NV04_PGRAPH_DMA_B_TLB_TAG                          0x00401090
+// #define NV04_PGRAPH_DMA_B_ADJ_OFFSET                       0x00401094
+// #define NV04_PGRAPH_DMA_B_OFFSET                           0x00401098
+// #define NV04_PGRAPH_DMA_B_SIZE                             0x0040109C
+// #define NV04_PGRAPH_DMA_B_Y_SIZE                           0x004010A0
 #define NV40_PGRAPH_TILE1(i)                               0x00406900
 #define NV40_PGRAPH_TLIMIT1(i)                             0x00406904
 #define NV40_PGRAPH_TSIZE1(i)                              0x00406908
@@ -299,7 +299,7 @@
 /* It's a guess that this works on NV03. Confirmed on NV04, though */
 #define NV04_PFIFO_DELAY_0                                 0x00002040
 #define NV04_PFIFO_DMA_TIMESLICE                           0x00002044
-#define NV04_PFIFO_NEXT_CHANNEL                            0x00002050
+// #define NV04_PFIFO_NEXT_CHANNEL                            0x00002050
 #define NV03_PFIFO_INTR_0                                  0x00002100
 #define NV03_PFIFO_INTR_EN_0                               0x00002140
 #    define NV_PFIFO_INTR_CACHE_ERROR                         (1<< 0)
@@ -325,77 +325,77 @@
 #define NV03_PFIFO_CACHE1_PUSH1                            0x00003204
 #define NV04_PFIFO_CACHE1_DMA_PUSH                         0x00003220
 #define NV04_PFIFO_CACHE1_DMA_FETCH                        0x00003224
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_8_BYTES         0x00000000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_16_BYTES        0x00000008
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_24_BYTES        0x00000010
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_32_BYTES        0x00000018
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_40_BYTES        0x00000020
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_48_BYTES        0x00000028
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_56_BYTES        0x00000030
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_64_BYTES        0x00000038
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_72_BYTES        0x00000040
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_80_BYTES        0x00000048
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_88_BYTES        0x00000050
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_96_BYTES        0x00000058
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_104_BYTES       0x00000060
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_8_BYTES         0x00000000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_16_BYTES        0x00000008
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_24_BYTES        0x00000010
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_32_BYTES        0x00000018
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_40_BYTES        0x00000020
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_48_BYTES        0x00000028
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_56_BYTES        0x00000030
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_64_BYTES        0x00000038
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_72_BYTES        0x00000040
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_80_BYTES        0x00000048
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_88_BYTES        0x00000050
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_96_BYTES        0x00000058
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_104_BYTES       0x00000060
 #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_112_BYTES       0x00000068
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_120_BYTES       0x00000070
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_120_BYTES       0x00000070
 #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_128_BYTES       0x00000078
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_136_BYTES       0x00000080
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_144_BYTES       0x00000088
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_152_BYTES       0x00000090
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_160_BYTES       0x00000098
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_168_BYTES       0x000000A0
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_176_BYTES       0x000000A8
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_184_BYTES       0x000000B0
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_192_BYTES       0x000000B8
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_200_BYTES       0x000000C0
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_208_BYTES       0x000000C8
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_216_BYTES       0x000000D0
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_224_BYTES       0x000000D8
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_232_BYTES       0x000000E0
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_240_BYTES       0x000000E8
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_248_BYTES       0x000000F0
-#    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_256_BYTES       0x000000F8
-#    define NV_PFIFO_CACHE1_DMA_FETCH_SIZE                 0x0000E000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_SIZE_32_BYTES        0x00000000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_SIZE_64_BYTES        0x00002000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_SIZE_96_BYTES        0x00004000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_136_BYTES       0x00000080
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_144_BYTES       0x00000088
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_152_BYTES       0x00000090
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_160_BYTES       0x00000098
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_168_BYTES       0x000000A0
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_176_BYTES       0x000000A8
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_184_BYTES       0x000000B0
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_192_BYTES       0x000000B8
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_200_BYTES       0x000000C0
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_208_BYTES       0x000000C8
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_216_BYTES       0x000000D0
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_224_BYTES       0x000000D8
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_232_BYTES       0x000000E0
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_240_BYTES       0x000000E8
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_248_BYTES       0x000000F0
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_TRIG_256_BYTES       0x000000F8
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_SIZE                 0x0000E000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_SIZE_32_BYTES        0x00000000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_SIZE_64_BYTES        0x00002000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_SIZE_96_BYTES        0x00004000
 #    define NV_PFIFO_CACHE1_DMA_FETCH_SIZE_128_BYTES       0x00006000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_SIZE_160_BYTES       0x00008000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_SIZE_192_BYTES       0x0000A000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_SIZE_224_BYTES       0x0000C000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_SIZE_256_BYTES       0x0000E000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS             0x001F0000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_0           0x00000000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_1           0x00010000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_2           0x00020000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_3           0x00030000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_SIZE_160_BYTES       0x00008000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_SIZE_192_BYTES       0x0000A000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_SIZE_224_BYTES       0x0000C000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_SIZE_256_BYTES       0x0000E000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS             0x001F0000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_0           0x00000000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_1           0x00010000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_2           0x00020000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_3           0x00030000
 #    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_4           0x00040000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_5           0x00050000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_6           0x00060000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_7           0x00070000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_5           0x00050000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_6           0x00060000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_7           0x00070000
 #    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_8           0x00080000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_9           0x00090000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_10          0x000A0000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_11          0x000B0000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_12          0x000C0000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_13          0x000D0000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_14          0x000E0000
-#    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_15          0x000F0000
-#    define NV_PFIFO_CACHE1_ENDIAN                         0x80000000
-#    define NV_PFIFO_CACHE1_LITTLE_ENDIAN                  0x7FFFFFFF
-#    define NV_PFIFO_CACHE1_BIG_ENDIAN                     0x80000000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_9           0x00090000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_10          0x000A0000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_11          0x000B0000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_12          0x000C0000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_13          0x000D0000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_14          0x000E0000
+// #    define NV_PFIFO_CACHE1_DMA_FETCH_MAX_REQS_15          0x000F0000
+// #    define NV_PFIFO_CACHE1_ENDIAN                         0x80000000
+// #    define NV_PFIFO_CACHE1_LITTLE_ENDIAN                  0x7FFFFFFF
+// #    define NV_PFIFO_CACHE1_BIG_ENDIAN                     0x80000000
 #define NV04_PFIFO_CACHE1_DMA_STATE                        0x00003228
 #define NV04_PFIFO_CACHE1_DMA_INSTANCE                     0x0000322c
 #define NV04_PFIFO_CACHE1_DMA_CTL                          0x00003230
 #define NV04_PFIFO_CACHE1_DMA_PUT                          0x00003240
 #define NV04_PFIFO_CACHE1_DMA_GET                          0x00003244
 #define NV10_PFIFO_CACHE1_REF_CNT                          0x00003248
-#define NV10_PFIFO_CACHE1_DMA_SUBROUTINE                   0x0000324C
+// #define NV10_PFIFO_CACHE1_DMA_SUBROUTINE                   0x0000324C
 #define NV03_PFIFO_CACHE1_PULL0                            0x00003240
 #define NV04_PFIFO_CACHE1_PULL0                            0x00003250
-#define NV03_PFIFO_CACHE1_PULL1                            0x00003250
+// #define NV03_PFIFO_CACHE1_PULL1                            0x00003250
 #define NV04_PFIFO_CACHE1_PULL1                            0x00003254
 #define NV04_PFIFO_CACHE1_HASH                             0x00003258
 #define NV10_PFIFO_CACHE1_ACQUIRE_TIMEOUT                  0x00003260
@@ -413,24 +413,24 @@
 #define NV40_PFIFO_CACHE1_DATA(i)                  (0x00090004+(i*8))
 
 #define NV_CRTC0_INTSTAT                                   0x00600100
-#define NV_CRTC0_INTEN                                     0x00600140
+// #define NV_CRTC0_INTEN                                     0x00600140
 #define NV_CRTC1_INTSTAT                                   0x00602100
-#define NV_CRTC1_INTEN                                     0x00602140
+// #define NV_CRTC1_INTEN                                     0x00602140
 #    define NV_CRTC_INTR_VBLANK                                (1<<0)
 
-/* Fifo commands. These are not regs, neither masks */
-#define NV03_FIFO_CMD_JUMP                                 0x20000000
-#define NV03_FIFO_CMD_JUMP_OFFSET_MASK                     0x1ffffffc
-#define NV03_FIFO_CMD_REWIND                               (NV03_FIFO_CMD_JUMP | (0 & NV03_FIFO_CMD_JUMP_OFFSET_MASK))
-
-/* RAMFC offsets */
-#define NV04_RAMFC_DMA_PUT                                       0x00
-#define NV04_RAMFC_DMA_GET                                       0x04
+// /* Fifo commands. These are not regs, neither masks */
+// #define NV03_FIFO_CMD_JUMP                                 0x20000000
+// #define NV03_FIFO_CMD_JUMP_OFFSET_MASK                     0x1ffffffc
+// #define NV03_FIFO_CMD_REWIND                               (NV03_FIFO_CMD_JUMP | (0 & NV03_FIFO_CMD_JUMP_OFFSET_MASK))
+// 
+// /* RAMFC offsets */
+// #define NV04_RAMFC_DMA_PUT                                       0x00
+// #define NV04_RAMFC_DMA_GET                                       0x04
 #define NV04_RAMFC_DMA_INSTANCE                                  0x08
 #define NV04_RAMFC_DMA_FETCH                                     0x10
 
-#define NV10_RAMFC_DMA_PUT                                       0x00
-#define NV10_RAMFC_DMA_GET                                       0x04
+// #define NV10_RAMFC_DMA_PUT                                       0x00
+// #define NV10_RAMFC_DMA_GET                                       0x04
 #define NV10_RAMFC_REF_CNT                                       0x08
 #define NV10_RAMFC_DMA_INSTANCE                                  0x0C
 #define NV10_RAMFC_DMA_STATE                                     0x10
@@ -441,7 +441,7 @@
 #define NV10_RAMFC_ACQUIRE_TIMESTAMP                             0x24
 #define NV10_RAMFC_ACQUIRE_TIMEOUT                               0x28
 #define NV10_RAMFC_SEMAPHORE                                     0x2C
-#define NV10_RAMFC_DMA_SUBROUTINE                                0x30
+// #define NV10_RAMFC_DMA_SUBROUTINE                                0x30
 
 #define NV40_RAMFC_DMA_PUT                                       0x00
 #define NV40_RAMFC_DMA_GET                                       0x04
@@ -460,8 +460,8 @@
 #define NV40_RAMFC_GRCTX_INSTANCE /* guess */                    0x38
 #define NV40_RAMFC_DMA_TIMESLICE                                 0x3C
 #define NV40_RAMFC_UNK_40                                        0x40
-#define NV40_RAMFC_UNK_44                                        0x44
-#define NV40_RAMFC_UNK_48                                        0x48
-#define NV40_RAMFC_2088                                          0x4C
-#define NV40_RAMFC_3300                                          0x50
+// #define NV40_RAMFC_UNK_44                                        0x44
+// #define NV40_RAMFC_UNK_48                                        0x48
+// #define NV40_RAMFC_2088                                          0x4C
+// #define NV40_RAMFC_3300                                          0x50
 
-- 
1.5.1.6


--MP_cnR/CUVHa/akL/78FSbfPWi
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--MP_cnR/CUVHa/akL/78FSbfPWi--

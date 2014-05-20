From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 09/12] nv50, nvc0: allow 15, 16,
	30 bpp display formats
Date: Tue, 20 May 2014 19:40:03 -0400
Message-ID: <1400629206-4447-10-git-send-email-imirkin@alum.mit.edu>
References: <1400629206-4447-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1400629206-4447-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Christoph Bumiller <christoph.bumiller-D4IDLmZPRBc@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Christoph Bumiller <christoph.bumiller-D4IDLmZPRBc@public.gmane.org>

Reviewed-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/gallium/drivers/nouveau/nv50/nv50_formats.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_formats.c b/src/gallium/drivers/nouveau/nv50/nv50_formats.c
index 3af34c1..ff33654 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_formats.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_formats.c
@@ -194,9 +194,9 @@ const struct nv50_format nv50_format_table[PIPE_FORMAT_COUNT] =
    SXB(S8X24_UINT, C0, S8_Z24, T),
    SXB(X32_S8X24_UINT, C1, Z32_S8_X24, T),
 
-   F3B(B5G6R5_UNORM, B5G6R5_UNORM, C2, C1, C0, xx, UNORM, 5_6_5, T),
-   C4B(B5G5R5A1_UNORM, BGR5_A1_UNORM, C2, C1, C0, C3, UNORM, 5_5_5_1, TB),
-   F3B(B5G5R5X1_UNORM, BGR5_X1_UNORM, C2, C1, C0, xx, UNORM, 5_5_5_1, TB),
+   F3B(B5G6R5_UNORM, B5G6R5_UNORM, C2, C1, C0, xx, UNORM, 5_6_5, TD),
+   C4B(B5G5R5A1_UNORM, BGR5_A1_UNORM, C2, C1, C0, C3, UNORM, 5_5_5_1, TD),
+   F3B(B5G5R5X1_UNORM, BGR5_X1_UNORM, C2, C1, C0, xx, UNORM, 5_5_5_1, TD),
    C4B(B4G4R4A4_UNORM, NONE, C2, C1, C0, C3, UNORM, 4_4_4_4, T),
    F3B(B4G4R4X4_UNORM, NONE, C2, C1, C0, xx, UNORM, 4_4_4_4, T),
    F3B(R9G9B9E5_FLOAT, NONE, C0, C1, C2, xx, FLOAT, 9_9_9_E5, T),
@@ -204,7 +204,7 @@ const struct nv50_format nv50_format_table[PIPE_FORMAT_COUNT] =
    C4A(R10G10B10A2_UNORM, RGB10_A2_UNORM, C0, C1, C2, C3, UNORM, 10_10_10_2,
        IBV, 0),
    C4A(B10G10R10A2_UNORM, BGR10_A2_UNORM, C2, C1, C0, C3, UNORM, 10_10_10_2,
-       TBV, 1),
+       TDV, 1),
    C4A(R10G10B10A2_SNORM, NONE, C0, C1, C2, C3, SNORM, 10_10_10_2, TV, 0),
    C4A(B10G10R10A2_SNORM, NONE, C2, C1, C0, C3, SNORM, 10_10_10_2, TV, 1),
    C4A(R10G10B10A2_UINT, RGB10_A2_UINT, C0, C1, C2, C3, UINT, 10_10_10_2, TRV, 0),
-- 
1.8.5.5

From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 2/3] gk110: add in forgotten code for gk110 isa
Date: Fri,  6 Jun 2014 15:43:42 -0400
Message-ID: <1402083823-23828-2-git-send-email-imirkin@alum.mit.edu>
References: <1402083823-23828-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1402083823-23828-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: mesa-dev@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Cc: "10.2" <mesa-stable@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "10.2" <mesa-stable@lists.freedesktop.org>
---

Pretty sure this was the cause of all the "invalid opcode" errors on like 20%
of the piglit tests. Any time the 3d blit path was used, this would trigger.

 src/gallium/drivers/nouveau/nvc0/nvc0_surface.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c b/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
index ef40f87..c28ec6d 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
@@ -683,6 +683,15 @@ nvc0_blitter_make_vp(struct nvc0_blitter *blit)
       0x03f01c46, 0x0a7e0080, /* export b96 o[0x80] $r0:$r1:$r2 */
       0x00001de7, 0x80000000, /* exit */
    };
+   static const uint32_t code_gk110[] =
+   {
+      0x00000000, 0x08000000, /* sched */
+      0x401ffc12, 0x7ec7fc00, /* ld b64 $r4d a[0x80] 0x0 0x0 */
+      0x481ffc02, 0x7ecbfc00, /* ld b96 $r0t a[0x90] 0x0 0x0 */
+      0x381ffc12, 0x7f07fc00, /* st b64 a[0x70] $r4d 0x0 0x0 */
+      0x401ffc02, 0x7f0bfc00, /* st b96 a[0x80] $r0t 0x0 0x0 */
+      0x001c003c, 0x18000000, /* exit */
+   };
    static const uint32_t code_gm107[] =
    {
       0xfc0007e0, 0x001f8000, /* sched 0x7e0 0x7e0 0x7e0 */
@@ -700,6 +709,10 @@ nvc0_blitter_make_vp(struct nvc0_blitter *blit)
       blit->vp.code = (uint32_t *)code_gm107; /* const_cast */
       blit->vp.code_size = sizeof(code_gm107);
    } else
+   if (blit->screen->base.class_3d >= NVF0_3D_CLASS) {
+      blit->vp.code = (uint32_t *)code_gk110; /* const_cast */
+      blit->vp.code_size = sizeof(code_gk110);
+   } else
    if (blit->screen->base.class_3d >= NVE4_3D_CLASS) {
       blit->vp.code = (uint32_t *)code_nve4; /* const_cast */
       blit->vp.code_size = sizeof(code_nve4);
-- 
1.8.5.5

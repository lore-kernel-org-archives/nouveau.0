From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] nv30: don't overwrite blend color setting for
	r32/r16 float formats
Date: Mon, 27 Jan 2014 15:51:07 -0500
Message-ID: <1390855867-18361-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces@lists.freedesktop.org
Errors-To: mesa-dev-bounces@lists.freedesktop.org
To: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

Untested. Happened to see this when I was reading this file (don't ask). I
can't imagine the current situation to be the intended one, based on this
code...

 src/gallium/drivers/nouveau/nv30/nv30_state_validate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/gallium/drivers/nouveau/nv30/nv30_state_validate.c b/src/gallium/drivers/nouveau/nv30/nv30_state_validate.c
index f227559..b5584c8 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_state_validate.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_state_validate.c
@@ -190,7 +190,7 @@ nv30_validate_blend_colour(struct nv30_context *nv30)
          BEGIN_NV04(push, SUBC_3D(0x037c), 1);
          PUSH_DATA (push, (util_float_to_half(rgba[2]) <<  0) |
                           (util_float_to_half(rgba[3]) << 16));
-         break;
+         return;
       default:
          break;
       }
-- 
1.8.3.2

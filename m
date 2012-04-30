From: Lucas Stach <dev@lynxeye.de>
Subject: [PATCH] nouveau/vieux: only advertise supported texture
	formats
Date: Mon, 30 Apr 2012 19:16:54 +0200
Message-ID: <1335806214-13903-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org
Cc: mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Fixes an assertion seen by users.

Signed-off-by: Lucas Stach <dev@lynxeye.de>
Tested-by: JohnDoe_71Rus on irc
---
 src/mesa/drivers/dri/nouveau/nouveau_context.c |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/src/mesa/drivers/dri/nouveau/nouveau_context.c b/src/mesa/drivers/dri/nouveau/nouveau_context.c
index 4845767..46c0d70 100644
--- a/src/mesa/drivers/dri/nouveau/nouveau_context.c
+++ b/src/mesa/drivers/dri/nouveau/nouveau_context.c
@@ -117,6 +117,15 @@ nouveau_context_init(struct gl_context *ctx, struct nouveau_screen *screen,
 	nouveau_span_functions_init(ctx);
 	_mesa_allow_light_in_model(ctx, GL_FALSE);
 
+	/* only advertise supported texture formats */
+	memset(&ctx->TextureFormatSupported, 0,
+	       sizeof(ctx->TextureFormatSupported));
+	ctx->TextureFormatSupported[MESA_FORMAT_XRGB8888] = true;
+	ctx->TextureFormatSupported[MESA_FORMAT_ARGB8888] = true;
+	ctx->TextureFormatSupported[MESA_FORMAT_RGB565] = true;
+	ctx->TextureFormatSupported[MESA_FORMAT_Z16] = true;
+	ctx->TextureFormatSupported[MESA_FORMAT_Z24_S8] = true;
+
 	/* Allocate a hardware channel. */
 	ret = nouveau_object_new(&context_dev(ctx)->object, 0xbeef0000,
 				 NOUVEAU_FIFO_CHANNEL_CLASS,
-- 
1.7.10

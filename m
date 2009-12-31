From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] Print NOUVEAU_NO_SWIZZLE and NOUVEAU_NO_TRANSFER
	messages only once
Date: Thu, 31 Dec 2009 13:24:20 +0100
Message-ID: <1262262260-3526-1-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
Cc: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Currently we are continuously spewing messages messages about these variables since we call debug_get_bool_option everytime we want to check their value
This is annoying, slows things down due to terminal rerendering and obscures useful messages.
This patch only calls debug_get_bool_option once and caches the result in a static variable.
---
 src/gallium/drivers/nv04/nv04_transfer.c |    6 ++++--
 src/gallium/drivers/nv10/nv10_transfer.c |    6 ++++--
 src/gallium/drivers/nv20/nv20_miptree.c  |    5 ++++-
 src/gallium/drivers/nv20/nv20_transfer.c |    6 ++++--
 src/gallium/drivers/nv30/nv30_miptree.c  |    5 ++++-
 src/gallium/drivers/nv30/nv30_transfer.c |    6 ++++--
 src/gallium/drivers/nv40/nv40_miptree.c  |    5 ++++-
 src/gallium/drivers/nv40/nv40_transfer.c |    6 ++++--
 8 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/src/gallium/drivers/nv04/nv04_transfer.c b/src/gallium/drivers/nv04/nv04_transfer.c
index 2dd2e14..f7a64f9 100644
--- a/src/gallium/drivers/nv04/nv04_transfer.c
+++ b/src/gallium/drivers/nv04/nv04_transfer.c
@@ -41,6 +41,9 @@ nv04_transfer_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
 	struct nv04_miptree *mt = (struct nv04_miptree *)pt;
 	struct nv04_transfer *tx;
 	struct pipe_texture tx_tex_template, *tx_tex;
+	static int no_transfer = -1;
+	if(no_transfer < 0)
+		no_transfer = debug_get_bool_option("NOUVEAU_NO_TRANSFER", TRUE/*XXX:FALSE*/);
 
 	tx = CALLOC_STRUCT(nv04_transfer);
 	if (!tx)
@@ -58,8 +61,7 @@ nv04_transfer_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
 	tx->base.zslice = zslice;
 
 	/* Direct access to texture */
-	if ((pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC ||
-	     debug_get_bool_option("NOUVEAU_NO_TRANSFER", TRUE/*XXX:FALSE*/)) &&
+	if ((pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC || no_transfer) &&
 	    pt->tex_usage & NOUVEAU_TEXTURE_USAGE_LINEAR)
 	{
 		tx->direct = true;
diff --git a/src/gallium/drivers/nv10/nv10_transfer.c b/src/gallium/drivers/nv10/nv10_transfer.c
index eb04af9..d834638 100644
--- a/src/gallium/drivers/nv10/nv10_transfer.c
+++ b/src/gallium/drivers/nv10/nv10_transfer.c
@@ -41,6 +41,9 @@ nv10_transfer_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
 	struct nv10_miptree *mt = (struct nv10_miptree *)pt;
 	struct nv10_transfer *tx;
 	struct pipe_texture tx_tex_template, *tx_tex;
+	static int no_transfer = -1;
+	if(no_transfer < 0)
+		no_transfer = debug_get_bool_option("NOUVEAU_NO_TRANSFER", TRUE/*XXX:FALSE*/);
 
 	tx = CALLOC_STRUCT(nv10_transfer);
 	if (!tx)
@@ -58,8 +61,7 @@ nv10_transfer_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
 	tx->base.zslice = zslice;
 
 	/* Direct access to texture */
-	if ((pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC ||
-	     debug_get_bool_option("NOUVEAU_NO_TRANSFER", TRUE/*XXX:FALSE*/)) &&
+	if ((pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC || no_transfer) &&
 	    pt->tex_usage & NOUVEAU_TEXTURE_USAGE_LINEAR)
 	{
 		tx->direct = true;
diff --git a/src/gallium/drivers/nv20/nv20_miptree.c b/src/gallium/drivers/nv20/nv20_miptree.c
index 8f7538e..c0ec60d 100644
--- a/src/gallium/drivers/nv20/nv20_miptree.c
+++ b/src/gallium/drivers/nv20/nv20_miptree.c
@@ -89,6 +89,9 @@ nv20_miptree_create(struct pipe_screen *screen, const struct pipe_texture *pt)
 	struct nv20_miptree *mt;
 	unsigned buf_usage = PIPE_BUFFER_USAGE_PIXEL |
 	                     NOUVEAU_BUFFER_USAGE_TEXTURE;
+	static int no_swizzle = -1;
+	if(no_swizzle < 0)
+		no_swizzle = debug_get_bool_option("NOUVEAU_NO_SWIZZLE", FALSE);
 
 	mt = MALLOC(sizeof(struct nv20_miptree));
 	if (!mt)
@@ -116,7 +119,7 @@ nv20_miptree_create(struct pipe_screen *screen, const struct pipe_texture *pt)
 		case PIPE_FORMAT_X8R8G8B8_UNORM:
 		case PIPE_FORMAT_R16_SNORM:
 		{
-			if (debug_get_bool_option("NOUVEAU_NO_SWIZZLE", FALSE))
+			if (no_swizzle)
 				mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
 			break;
 		}
diff --git a/src/gallium/drivers/nv20/nv20_transfer.c b/src/gallium/drivers/nv20/nv20_transfer.c
index 699773e..2d06e79 100644
--- a/src/gallium/drivers/nv20/nv20_transfer.c
+++ b/src/gallium/drivers/nv20/nv20_transfer.c
@@ -41,6 +41,9 @@ nv20_transfer_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
 	struct nv20_miptree *mt = (struct nv20_miptree *)pt;
 	struct nv20_transfer *tx;
 	struct pipe_texture tx_tex_template, *tx_tex;
+	static int no_transfer = -1;
+	if(no_transfer < 0)
+		no_transfer = debug_get_bool_option("NOUVEAU_NO_TRANSFER", TRUE/*XXX:FALSE*/);
 
 	tx = CALLOC_STRUCT(nv20_transfer);
 	if (!tx)
@@ -58,8 +61,7 @@ nv20_transfer_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
 	tx->base.zslice = zslice;
 
 	/* Direct access to texture */
-	if ((pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC ||
-	     debug_get_bool_option("NOUVEAU_NO_TRANSFER", TRUE/*XXX:FALSE*/)) &&
+	if ((pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC || no_transfer) &&
 	    pt->tex_usage & NOUVEAU_TEXTURE_USAGE_LINEAR)
 	{
 		tx->direct = true;
diff --git a/src/gallium/drivers/nv30/nv30_miptree.c b/src/gallium/drivers/nv30/nv30_miptree.c
index 8fbba38..c4838f2 100644
--- a/src/gallium/drivers/nv30/nv30_miptree.c
+++ b/src/gallium/drivers/nv30/nv30_miptree.c
@@ -65,6 +65,9 @@ nv30_miptree_create(struct pipe_screen *pscreen, const struct pipe_texture *pt)
 	struct nv30_miptree *mt;
 	unsigned buf_usage = PIPE_BUFFER_USAGE_PIXEL |
 	                     NOUVEAU_BUFFER_USAGE_TEXTURE;
+	static int no_swizzle = -1;
+	if(no_swizzle < 0)
+		no_swizzle = debug_get_bool_option("NOUVEAU_NO_SWIZZLE", FALSE);
 
 	mt = MALLOC(sizeof(struct nv30_miptree));
 	if (!mt)
@@ -97,7 +100,7 @@ nv30_miptree_create(struct pipe_screen *pscreen, const struct pipe_texture *pt)
 		case PIPE_FORMAT_L8_UNORM:
 		case PIPE_FORMAT_I8_UNORM:
 		{
-			if (debug_get_bool_option("NOUVEAU_NO_SWIZZLE", FALSE))
+			if (no_swizzle)
 				mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
  			break;
 		}
diff --git a/src/gallium/drivers/nv30/nv30_transfer.c b/src/gallium/drivers/nv30/nv30_transfer.c
index 6559899..1beed72 100644
--- a/src/gallium/drivers/nv30/nv30_transfer.c
+++ b/src/gallium/drivers/nv30/nv30_transfer.c
@@ -41,6 +41,9 @@ nv30_transfer_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
 	struct nv30_miptree *mt = (struct nv30_miptree *)pt;
 	struct nv30_transfer *tx;
 	struct pipe_texture tx_tex_template, *tx_tex;
+	static int no_transfer = -1;
+	if(no_transfer < 0)
+		no_transfer = debug_get_bool_option("NOUVEAU_NO_TRANSFER", TRUE/*XXX:FALSE*/);
 
 	tx = CALLOC_STRUCT(nv30_transfer);
 	if (!tx)
@@ -58,8 +61,7 @@ nv30_transfer_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
 	tx->base.zslice = zslice;
 
 	/* Direct access to texture */
-	if ((pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC ||
-	     debug_get_bool_option("NOUVEAU_NO_TRANSFER", TRUE/*XXX:FALSE*/)) &&
+	if ((pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC || no_transfer) &&
 	    pt->tex_usage & NOUVEAU_TEXTURE_USAGE_LINEAR)
 	{
 		tx->direct = true;
diff --git a/src/gallium/drivers/nv40/nv40_miptree.c b/src/gallium/drivers/nv40/nv40_miptree.c
index 89bd155..818519c 100644
--- a/src/gallium/drivers/nv40/nv40_miptree.c
+++ b/src/gallium/drivers/nv40/nv40_miptree.c
@@ -67,6 +67,9 @@ nv40_miptree_create(struct pipe_screen *pscreen, const struct pipe_texture *pt)
 	struct nv40_miptree *mt;
 	unsigned buf_usage = PIPE_BUFFER_USAGE_PIXEL |
 	                     NOUVEAU_BUFFER_USAGE_TEXTURE;
+	static int no_swizzle = -1;
+	if(no_swizzle < 0)
+		no_swizzle = debug_get_bool_option("NOUVEAU_NO_SWIZZLE", FALSE);
 
 	mt = MALLOC(sizeof(struct nv40_miptree));
 	if (!mt)
@@ -94,7 +97,7 @@ nv40_miptree_create(struct pipe_screen *pscreen, const struct pipe_texture *pt)
 		case PIPE_FORMAT_X8R8G8B8_UNORM:
 		case PIPE_FORMAT_R16_SNORM:
 		{
-			if (debug_get_bool_option("NOUVEAU_NO_SWIZZLE", FALSE))
+			if (no_swizzle)
 				mt->base.tex_usage |= NOUVEAU_TEXTURE_USAGE_LINEAR;
 			break;
 		}
diff --git a/src/gallium/drivers/nv40/nv40_transfer.c b/src/gallium/drivers/nv40/nv40_transfer.c
index 791ee68..edecafb 100644
--- a/src/gallium/drivers/nv40/nv40_transfer.c
+++ b/src/gallium/drivers/nv40/nv40_transfer.c
@@ -41,6 +41,9 @@ nv40_transfer_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
 	struct nv40_miptree *mt = (struct nv40_miptree *)pt;
 	struct nv40_transfer *tx;
 	struct pipe_texture tx_tex_template, *tx_tex;
+	static int no_transfer = -1;
+	if(no_transfer < 0)
+		no_transfer = debug_get_bool_option("NOUVEAU_NO_TRANSFER", TRUE/*XXX:FALSE*/);
 
 	tx = CALLOC_STRUCT(nv40_transfer);
 	if (!tx)
@@ -58,8 +61,7 @@ nv40_transfer_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
 	tx->base.zslice = zslice;
 
 	/* Direct access to texture */
-	if ((pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC ||
-	     debug_get_bool_option("NOUVEAU_NO_TRANSFER", TRUE/*XXX:FALSE*/)) &&
+	if ((pt->tex_usage & PIPE_TEXTURE_USAGE_DYNAMIC || no_transfer) &&
 	    pt->tex_usage & NOUVEAU_TEXTURE_USAGE_LINEAR)
 	{
 		tx->direct = true;
-- 
1.6.3.3

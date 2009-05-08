From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: [PATCH] gallium/nv50: fix multi-texturing
Date: Fri, 08 May 2009 19:13:59 +0200
Message-ID: <4A046857.7020405@student.tuwien.ac.at>
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
List-Id: nouveau.vger.kernel.org

This one maps textures to sampler units (or textures to texture units
or whatever it's called), which wasn't done before. It should make the
mesa demo "multiarb" work, at least with the shader patches I sent
earlier. Of course, with this functionality one probably wouldn't have
to setup the textures in NV50_TIC anew every time, but that can be
optimized later.

-----------------------------
commit bced24ac0c6ac6f3d3b7c2627595b09c20d419ca
Author: chr <chr@LAPTOP.(none)>
Date:   Fri May 8 18:48:45 2009 +0200

    nv50: Fix multi-texturing.
    We need to bind textures to sampler units.

diff --git a/src/gallium/drivers/nv50/nv50_context.h b/src/gallium/drivers/nv50/nv50_context.h
index 7b67a75..d6a7c76 100644
--- a/src/gallium/drivers/nv50/nv50_context.h
+++ b/src/gallium/drivers/nv50/nv50_context.h
@@ -151,6 +151,7 @@ struct nv50_context {
 	unsigned sampler_nr;
 	struct nv50_miptree *miptree[PIPE_MAX_SAMPLERS];
 	unsigned miptree_nr;
+	unsigned texbind_nr;
 };

 static INLINE struct nv50_context *
diff --git a/src/gallium/drivers/nv50/nv50_tex.c b/src/gallium/drivers/nv50/nv50_tex.c
index 223c8a3..e7e1521 100644
--- a/src/gallium/drivers/nv50/nv50_tex.c
+++ b/src/gallium/drivers/nv50/nv50_tex.c
@@ -136,8 +136,12 @@ nv50_tex_validate(struct nv50_context *nv50)
 	struct nouveau_grobj *tesla = nv50->screen->tesla;
 	struct nouveau_stateobj *so;
 	int unit;
+	unsigned push_nr;

-	so = so_new(nv50->miptree_nr * 8 + 3, nv50->miptree_nr * 2);
+	push_nr = MAX2(nv50->miptree_nr, nv50->texbind_nr) * 2;
+	push_nr += nv50->miptree_nr * 8 + 3;
+
+	so = so_new(push_nr, nv50->miptree_nr * 2);
 	so_method(so, tesla, 0x0f00, 1);
 	so_data  (so, NV50_CB_TIC);
 	so_method(so, tesla, 0x40000f04, nv50->miptree_nr * 8);
@@ -151,6 +155,16 @@ nv50_tex_validate(struct nv50_context *nv50)
 		}
 	}

+	for (unit = 0; unit < nv50->miptree_nr; unit++) {
+		so_method(so, tesla, 0x1458, 1);
+		so_data  (so, (unit << 9) | (unit << 1) | 1);
+	}
+	for (; unit < nv50->texbind_nr; unit++) {
+		so_method(so, tesla, 0x1458, 1);
+		so_data  (so, (unit << 1) | 0);
+	}
+	nv50->texbind_nr = nv50->miptree_nr;
+
 	so_ref(so, &nv50->state.tic_upload);
 	so_ref(NULL, &so);
 }

-------------------------------------

From: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RFC 12/20] pm: add concept of sources
Date: Sun,  7 Jun 2015 22:40:22 +0200
Message-ID: <1433709630-3293-13-git-send-email-samuel.pitoiset@gmail.com>
References: <1433709630-3293-1-git-send-email-samuel.pitoiset@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0627561912=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1433709630-3293-1-git-send-email-samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
List-Id: nouveau.vger.kernel.org

--===============0627561912==
Content-Type: text/plain

From: Samuel Pitoiset <samuel.pitoisetœgmail.com>

A source (or multiplexer) is a tuple addr+mask+shift which allows to
control a block of signals. The maximum number of sources that a signal
can define is arbitrary limited to 8 and this should be large enough.
This patch allows to define multi-level of sources for a signal.

Each different sources are stored to a global list and will be exposed
to the userspace through the nvif interface in order to avoid conflicts.

Signed-off-by: Samuel Pitoiset <samuel.pitoiset at gmail.com>
---
 drm/nouveau/include/nvkm/engine/pm.h |  1 +
 drm/nouveau/nvkm/engine/pm/base.c    | 82 ++++++++++++++++++++++++++++++++++--
 drm/nouveau/nvkm/engine/pm/priv.h    | 24 +++++++++++
 3 files changed, 103 insertions(+), 4 deletions(-)

diff --git a/drm/nouveau/include/nvkm/engine/pm.h b/drm/nouveau/include/nvkm/engine/pm.h
index 6c2d057..130b545 100644
--- a/drm/nouveau/include/nvkm/engine/pm.h
+++ b/drm/nouveau/include/nvkm/engine/pm.h
@@ -11,6 +11,7 @@ struct nvkm_pm {
 	void *profile_data;
 
 	struct list_head domains;
+	struct list_head sources;
 	u32 sequence;
 };
 
diff --git a/drm/nouveau/nvkm/engine/pm/base.c b/drm/nouveau/nvkm/engine/pm/base.c
index 610c0ca..dfafefd 100644
--- a/drm/nouveau/nvkm/engine/pm/base.c
+++ b/drm/nouveau/nvkm/engine/pm/base.c
@@ -434,6 +434,67 @@ nvkm_pm_cclass = {
  * PPM engine/subdev functions
  ******************************************************************************/
 int
+nvkm_perfsrc_new(struct nvkm_pm *ppm, struct nvkm_perfsig *sig,
+		 const struct nvkm_specsrc *spec)
+{
+	const struct nvkm_specsrc *ssrc;
+	const struct nvkm_specmux *smux;
+	struct nvkm_perfsrc *src;
+	u8 source_nr = 0;
+
+	if (!spec) {
+		/* No sources are defined for this signal. */
+		return 0;
+	}
+
+	ssrc = spec;
+	while (ssrc->name) {
+		smux = ssrc->mux;
+		while (smux->name) {
+			bool found = false;
+			u8 source_id = 0;
+			u32 len;
+
+			list_for_each_entry(src, &ppm->sources, head) {
+				if (src->addr == ssrc->addr &&
+				    src->shift == smux->shift) {
+					found = true;
+					break;
+				}
+				source_id++;
+			}
+
+			if (!found) {
+				src = kzalloc(sizeof(*src), GFP_KERNEL);
+				if (!src)
+					return -ENOMEM;
+
+				src->addr   = ssrc->addr;
+				src->mask   = smux->mask;
+				src->shift  = smux->shift;
+				src->enable = smux->enable;
+
+				len = strlen(ssrc->name) +
+				      strlen(smux->name) + 2;
+				src->name = kzalloc(len, GFP_KERNEL);
+				if (!src->name)
+					return -ENOMEM;
+				snprintf(src->name, len, "%s_%s", ssrc->name,
+					 smux->name);
+
+				list_add_tail(&src->head, &ppm->sources);
+			}
+
+			sig->source[source_nr++] = source_id + 1;
+			smux++;
+		}
+		ssrc++;
+	}
+
+	return 0;
+}
+
+int
 nvkm_perfdom_new(struct nvkm_pm *ppm, const char *name, u32 mask,
 		 u32 base, u32 size_unit, u32 size_domain,
 		 const struct nvkm_specdom *spec)
@@ -441,7 +502,7 @@ nvkm_perfdom_new(struct nvkm_pm *ppm, const char *name, u32 mask,
 	const struct nvkm_specdom *sdom;
 	const struct nvkm_specsig *ssig;
 	struct nvkm_perfdom *dom;
-	int i;
+	int ret, i;
 
 	for (i = 0; i == 0 || mask; i++) {
 		u32 addr = base + (i * size_unit);
@@ -473,7 +534,12 @@ nvkm_perfdom_new(struct nvkm_pm *ppm, const char *name, u32 mask,
 
 			ssig = (sdom++)->signal;
 			while (ssig->name) {
-				dom->signal[ssig->signal].name = ssig->name;
+				struct nvkm_perfsig *sig =
+					&dom->signal[ssig->signal];
+				sig->name = ssig->name;
+				ret = nvkm_perfsrc_new(ppm, sig, ssig->source);
+				if (ret)
+					return ret;
 				ssig++;
 			}
 
@@ -504,13 +570,20 @@ void
 _nvkm_pm_dtor(struct nvkm_object *object)
 {
 	struct nvkm_pm *ppm = (void *)object;
-	struct nvkm_perfdom *dom, *tmp;
+	struct nvkm_perfdom *dom, *next_dom;
+	struct nvkm_perfsrc *src, *next_src;
 
-	list_for_each_entry_safe(dom, tmp, &ppm->domains, head) {
+	list_for_each_entry_safe(dom, next_dom, &ppm->domains, head) {
 		list_del(&dom->head);
 		kfree(dom);
 	}
 
+	list_for_each_entry_safe(src, next_src, &ppm->sources, head) {
+		list_del(&src->head);
+		kfree(src->name);
+		kfree(src);
+	}
+
 	nvkm_engine_destroy(&ppm->base);
 }
 
@@ -528,5 +601,6 @@ nvkm_pm_create_(struct nvkm_object *parent, struct nvkm_object *engine,
 		return ret;
 
 	INIT_LIST_HEAD(&ppm->domains);
+	INIT_LIST_HEAD(&ppm->sources);
 	return 0;
 }
diff --git a/drm/nouveau/nvkm/engine/pm/priv.h b/drm/nouveau/nvkm/engine/pm/priv.h
index 71667fc..f954c98 100644
--- a/drm/nouveau/nvkm/engine/pm/priv.h
+++ b/drm/nouveau/nvkm/engine/pm/priv.h
@@ -22,13 +22,37 @@ struct nvkm_perfctx {
 
 extern struct nvkm_oclass nvkm_pm_cclass;
 
+struct nvkm_specmux {
+	u32 mask;
+	u8 shift;
+	const char *name;
+	bool enable;
+};
+
+struct nvkm_specsrc {
+	u32 addr;
+	const struct nvkm_specmux *mux;
+	const char *name;
+};
+
+struct nvkm_perfsrc {
+	struct list_head head;
+	char *name;
+	u32 addr;
+	u32 mask;
+	u8 shift;
+	bool enable;
+};
+
 struct nvkm_specsig {
 	u8 signal;
 	const char *name;
+	const struct nvkm_specsrc *source;
 };
 
 struct nvkm_perfsig {
 	const char *name;
+	u8 source[8];
 };
 
 struct nvkm_specdom {
-- 
2.4.2


--===============0627561912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0627561912==--

From: Roel Kluin <12o3l-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: [PATCH] free nvs->pass_rec on error in
	nouveau_shader_pass2(), nouveau_shader_2.c
Date: Wed, 30 Jan 2008 00:56:27 +0100
Message-ID: <479FBD2B.3020309@tiscali.nl>
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

in nouveau_shader_pass2()

210:    struct pass2_rec *rec;
...
215:    rec = calloc(1, sizeof(struct pass2_rec));
...
218:    nvs->pass_rec = rec;

untested, please check.
--
also free nvs->pass_rec on error

Signed-off-by: Roel Kluin <12o3l-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
---
diff --git a/src/mesa/drivers/dri/nouveau/nouveau_shader_2.c b/src/mesa/drivers/dri/nouveau/nouveau_shader_2.c
index cd27dac..0bbcb8a 100644
--- a/src/mesa/drivers/dri/nouveau/nouveau_shader_2.c
+++ b/src/mesa/drivers/dri/nouveau/nouveau_shader_2.c
@@ -229,6 +229,8 @@ nouveau_shader_pass2(nvsPtr nvs)
 			     ((nvsSubroutine*)nvs->program_tree)->insn_head)) {
 		free(nvs->program);
 		nvs->program = NULL;
+		free(nvs->pass_rec);
+		nvs->pass_rec = NULL;
 		return GL_FALSE;
 	}

From: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Subject: [PATCH v2 2/3] docs: update GL3.txt,
	relnotes: mark GL_ARB_viewport_array as done for nvc0
Date: Sun, 15 Jun 2014 21:24:05 +0200
Message-ID: <1402860246-24772-3-git-send-email-tobias.johannes.klausmann@mni.thm.de>
References: <1402860246-24772-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1402860246-24772-1-git-send-email-tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
---
 docs/GL3.txt            | 2 +-
 docs/relnotes/10.3.html | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/GL3.txt b/docs/GL3.txt
index f5f940c..a392b92 100644
--- a/docs/GL3.txt
+++ b/docs/GL3.txt
@@ -132,7 +132,7 @@ GL 4.1:
   GL_ARB_separate_shader_objects                       DONE (all drivers)
   GL_ARB_shader_precision                              not started
   GL_ARB_vertex_attrib_64bit                           not started
-  GL_ARB_viewport_array                                DONE (i965, nv50, r600)
+  GL_ARB_viewport_array                                DONE (i965, nv50, nvc0, r600)
 
 
 GL 4.2:
diff --git a/docs/relnotes/10.3.html b/docs/relnotes/10.3.html
index 7ceaca4..6859a89 100644
--- a/docs/relnotes/10.3.html
+++ b/docs/relnotes/10.3.html
@@ -48,6 +48,7 @@ Note: some of the new features are only available with certain drivers.
 <li>GL_ARB_stencil_texturing on nv50, nvc0, r600, and radeonsi</li>
 <li>GL_ARB_texture_cube_map_array on radeonsi</li>
 <li>GL_ARB_compressed_texture_pixel_storage on all drivers</li>
+<li>GL_ARB_viewport_array on nvc0</li>
 </ul>
 
 
-- 
1.8.4.5

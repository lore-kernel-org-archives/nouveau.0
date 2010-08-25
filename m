From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: try to load fbcon
Date: Wed, 25 Aug 2010 20:18:13 +0200
Message-ID: <20100825181813.GA6991@joi.lan>
References: <AANLkTinqnf3qpSBhb6g7EtxVO3d+_BbcYfxXZJC9Ht9A@mail.gmail.com>
	<87sk22brd2.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87sk22brd2.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dragos Delcea <dragos.delcea-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Aug 25, 2010 at 06:15:53PM +0200, Francisco Jerez wrote:
> Dragos Delcea <dragos.delcea-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
> 
> > Hi,
> >
> > I noticed that loading nouveau doesn't load fbcon automatically; and without fbcon, when loading nouveau the
> > console turns blank. I spent a few good hours until I was able to figure out that I had to manually modprobe
> > fbcon to get the console back after loading nouveau.
> > This is happening on a vanilla 2.6.35.3; shouldn't there be dependencies in place between modules?
> >
> > Note that I haven't got to the xorg part just yet, I'm currently installing gentoo.
> >
> We already do, except for kernels compiled with "Configure standard
> kernel features (for small systems)". Strictly speaking, nouveau doesn't
> depend on fbcon so that option is left open for e.g. embedded platforms
> that don't need a framebuffer console.

But it's only a build time dependency. Let's fix it.

---
From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: try to load fbcon

Currently users have to load fbcon manually or build it
into the kernel to have any console output.
Let's make it easy for them and load fbcon automatically
at init time. Nouveau already selects fbcon at build time
when !EMBEDDED.

Reported-by: Dragos Delcea <dragos.delcea-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
index a8d3d17..df9a687 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
@@ -434,6 +434,12 @@ static int __init nouveau_init(void)
 	if (!nouveau_modeset)
 		return 0;
 
+#if defined(CONFIG_FRAMEBUFFER_CONSOLE_MODULE)
+	request_module("fbcon");
+#elif !defined(CONFIG_FRAMEBUFFER_CONSOLE)
+	printk(KERN_INFO "CONFIG_FRAMEBUFFER_CONSOLE was not enabled. You won't get any console output.\n");
+#endif
+
 	nouveau_register_dsm_handler();
 	return drm_init(&driver);
 }
-- 
1.7.1.1

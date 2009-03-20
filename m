From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Building rawhide+darktama on 2.6.24 (Re:  DRM changes)
Date: Sat, 21 Mar 2009 01:48:12 +0200
Message-ID: <20090321014812.67321cf3@daedalus.pq.iki.fi>
References: <6a89f9d50903091449w47c8a79ak37124972b91a6fde@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/L=_nin3SmR/KJS+OW.pNo6z"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6a89f9d50903091449w47c8a79ak37124972b91a6fde-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--MP_/L=_nin3SmR/KJS+OW.pNo6z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, 9 Mar 2009 22:49:32 +0100
Stephane Marchesin <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org> wrote:

> As we discussed on irc, there would be multiple changes related to this:
> - we move to a linux kernel-like tree, that should make it easier when
> upstreaming the code.
> - this new tree is hosted in freedekstop.org in the nouveau/ git so we
> don't need additional accounts for everyone all around and people can
> keep pushing things (even better, all nouveau people can push to the
> drm, which used to require mesa rights before)
> - we keep a(some) branch(es) in the tree for backwards compat with
> older kernels. Either in the form of separate kernel versions
> including nouveau, or in the form of an out-of-tree-compilable
> drm/nouveau module.

Hi,

I took airlied's drm-rawhide kernel tree, applied darktama's patch
that adds Nouveau, wrote/copied my own compat-patches on top of that,
and compiled the DRM modules (drm.ko and nouveau.ko) against my
currently running kernel 2.6.24.

It works, with the caveat that I needed a tiny patch to 2.6.24 in
addition to reconfiguring it. The details will follow. I've been
running Nouveau for two hours now without any hickups.

I'm CC'ing also dri-devel@ just in case people working on other
drivers might be interested in offering a "drm.git-like" version
of their drivers for people with older, custom or otherwise
not-this-driver's-development-tree kernels. And because my
compat patches probably suck.

Feel free to drop the dri-devel@ CC when you discuss Nouveau-only
matters.


This raises some questions for Nouveau:
- like marcheu proposed, shall Nouveau DRM move into a kernel tree?
- do we abandon drm.git kernel directories completely?
- is the out-of-tree DRM build sketched below feasible for users?
- how do we maintain and distribute the compat patches and DRM code?

I'd expect the compat patches would be maintained by whoever happens
to run older kernels. Developers do not consider compat patching.


Building DRM out-of-tree for 2.6.24:

Prepare the "upstream" DRM and Nouveau code:

- Get airlied's linux kernel tree, the drm-rawhide branch:
http://git.kernel.org/?p=linux/kernel/git/airlied/drm-2.6.git;a=shortlog;h=drm-rawhide
(the version I used is probably a week old now)

- Get darktama's nouveau patch and apply it on drm-rawhide:
http://cvs.fedoraproject.org/viewvc/rpms/kernel/devel/drm-nouveau.patch?revision=1.25&view=markup
(this is probably outdated by now)

- apply the included nouveau-drm-compat-24.patch
This patch is combined from the individual patches listed in its
description, diffstat is included.

- run 'make clean' unless your tree is already clean.


Prepare your 2.6.24 kernel:

- apply the included kernel-compat-24.patch to export shmem_file_setup()

- configure the following as modules:
	CONFIG_DRM
	CONFIG_FB
	CONFIG_BACKLIGHT_CLASS_DEVICE
	CONFIG_FB_SAVAGE
The savage driver is abused to get FB_CFB_FILLRECT, FB_CFB_COPYAREA and
FB_CFB_IMAGEBLIT enabled, since they do not have menuconfig entries.
If you actually have a Savage card in your computer, maybe you should
pick another fb driver.

- build and install as usual, remove the drm.ko generated.


Building the DRM and Nouveau modules as external modules
using the 2.6.24 kernel tree:

- save the included mkbuild-nouveau.bash script

- edit the script, and fix the paths to the 2.6.24 and the
drm-rawhide kernel trees

- create a new empty directory and cd into it

- run '../mkbuild-nouveau.bash init', it should not whine
about anything, just print good stuff.

- run '../mkbuild-nouveau.bash build', it should build drm.ko and
nouveau.ko. These are probably created in the drm-rawhide kernel
tree.

- find the kernel modules, and load these:
	fb.ko
	drm.ko
	backlight.ko
	cfbcopyarea.ko
	cfbfillrect.ko
	cfbimgblt.ko
	nouveau.ko
Now the Nouveau DDX should run just fine using the new DRM modules.


Ben, I still don't see any comment from you on this thread :-)

-- 
Pekka Paalanen
http://www.iki.fi/pq/

--MP_/L=_nin3SmR/KJS+OW.pNo6z
Content-Type: text/plain
Content-Disposition: attachment; filename=mkbuild-nouveau.bash
Content-Transfer-Encoding: quoted-printable

#!/bin/bash

# 395e0ddc44005ced5e4fed9bfc2e4bdf63d37627 shmem_file_setup export

# Use e.g. CONFIG_FB_SAVAGE to get FB_CFB_FILLRECT, FB_CFB_COPYAREA
# and FB_CFB_IMAGEBLIT.

# cd into an empty directory, and call this script from there.

# Path to the kernel tree, from which DRM is built.
NKDIR=3D"/home/pq/linux/linux-2.6-torvalds"

# Path to the configured kernel tree you normally use
KDIR=3D"$(readlink -f /lib/modules/`uname -r`/source)"

# All resulting files *should* be written to OUTDIR, but it seems
# the external module directory does not honour that. I.e. the
# the external modules are built into DRMDIR.

DRMDIR=3D"$NKDIR/drivers/gpu/drm"
OUTDIR=3D"$(pwd)"
NEWCONFIG=3D"$OUTDIR/.config"

# --- nothing configurable below this line ---

CMD=3D"$1"

function config_check_ym {
	OPTION=3D"$1"
	grep -q -e "CONFIG_$OPTION=3D[ym]" "$NEWCONFIG" && return 0
	echo "Option CONFIG_$OPTION is not set in your kernel config."
	return 1
}

function config_require {
	local FAIL=3D0
	for REQ in "$@"; do
		config_check_ym "$REQ" || FAIL=3D1
	done
	return $FAIL
}

function die {
	echo "$@"
	exit 1
}

function kmake {
	make -C "$KDIR" O=3D"$OUTDIR" "$@"
}

function kmake_drm {
	kmake M=3D"$DRMDIR" EXTRA_CFLAGS=3D"-I$NKDIR/include/drm" "$@"
}

echo "KDIR     $KDIR"
echo "DRMDIR   $DRMDIR"
echo "OUTDIR   $OUTDIR"
echo ""

REQCFG=3D"DRM FB BACKLIGHT_CLASS_DEVICE FB_CFB_FILLRECT FB_CFB_COPYAREA F=
B_CFB_IMAGEBLIT"

case "$CMD" in
	init)
		cp "$KDIR/.config" "$NEWCONFIG"
		cp -a "$KDIR/scripts" "$OUTDIR/scripts"
		kmake silentoldconfig
		#echo -e "\nCONFIG_DRM_NOUVEAU=3Dm" >> "$NEWCONFIG"
		config_require $REQCFG || \
			die "Please, fix you kernel config to have: $REQCFG"
		;;
	build)
		kmake_drm drm.ko || \
			die "making drm.ko failed"
		kmake_drm nouveau/nouveau.ko || \
			die "making nouveau.ko failed"
		;;
	clean)
		kmake_drm clean
		;;
	*)
		echo "Unknown command: '$CMD'"
		echo "Supported commands: init build clean"
		echo "Please edit the script to configure it."
		exit 1
esac


--MP_/L=_nin3SmR/KJS+OW.pNo6z
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=nouveau-drm-compat-24.patch

Individual patches:

eae74f67e610b122b83344160fe6824f4d1fb157 nouveau compat: fix nouveau_backlight.c
643a6631225572577bb978bf680a8e62494cdb72 nouveau compat: fix nouveau_bo.c
d50c7807a9632f4b000880dd336f33d9d75bd86b nouveau compat: fix nouveau_sgdma.c
b721c48a61ad772aa35677a7a317838174dc388e nouveau compat: fix nouveau_object.c
9d1a9ea342b66bc890445f7ac1c1a3252daf0c48 nouveau compat: fix nouveau_state.c
4a5584e5dacbbab61f603b7f0aeac15373ee2c64 drm: hardwire nouveau to be built as a module
97f0b94f347584587d596a9c1d69995787d71682 drm: fix printf fmt in drm_bo.c
d0841aeb4a16b5da475665325c99462e6d17735f drm compat: fix drm_page_alloc.c
c1f22a2e71c37eaabe69998f65edc6e6abffd32c drm: functions in drm_compat.h must be static
560683d84115ff7bec3244c17feec866716eead9 drm compat: fix drm_bo_move.c
5d9c1ffc5458657fd9ef32b1b93081bca41cf595 drm compat: fix drm_ttm.c
3f5598aff86054e7b371c0cdb8549fb0ed8d2333 drm compat: fix drm_crtc_helper.c
e5e671c53fa493c1fa15960ba3480f877e6ef2f2 drm compat: fix drm_sysfs.c
68f6da44fe096291e5a0deb023e122a635a9fa37 drm: drm_compat.c needs drm_compat.h included
b3ecc3eed2c1e8e9d1470148e13bd330dc83eb4f drm compat: fix ati_pcigart.c
747bc5fd7fbe4934f5216058264b08ebb37f2d49 drm compat: fix drm_agpsupport.c
4ffe8e87f3525aac2f1bea0cf2987e67a3d3fe22 drm compat: fix drm_vm.c
d0314bca55ac5c267210fa7174db4520f1930fee drm compat: fix drm_memory.c
bad5327061659deb0022ef0e077aea23fdbcf98f drm compat: fix drm_fops.c
3c6581e9dbae013d2b5f475d57d02cdaf6a64319 drm compat: fix drm_gem.c
08d9dc3bd1f46e84bf5e1f541c4e823dfe984c95 drm compat: drm_compat.h needs version.h
d13a7913ec92cfc70294f6882bad58fcd5ddd2dc drm: add drm_compat.[ch]

 drivers/gpu/drm/Makefile                    |    3 +-
 drivers/gpu/drm/ati_pcigart.c               |    1 +
 drivers/gpu/drm/drm_agpsupport.c            |    1 +
 drivers/gpu/drm/drm_bo.c                    |    4 +-
 drivers/gpu/drm/drm_bo_move.c               |    3 +-
 drivers/gpu/drm/drm_compat.c                |  267 +++++++++++++++++++++++++
 drivers/gpu/drm/drm_compat.h                |  289 +++++++++++++++++++++++++++
 drivers/gpu/drm/drm_crtc_helper.c           |    1 +
 drivers/gpu/drm/drm_fops.c                  |    1 +
 drivers/gpu/drm/drm_gem.c                   |    1 +
 drivers/gpu/drm/drm_memory.c                |    1 +
 drivers/gpu/drm/drm_page_alloc.c            |    1 +
 drivers/gpu/drm/drm_sysfs.c                 |    1 +
 drivers/gpu/drm/drm_ttm.c                   |    1 +
 drivers/gpu/drm/drm_vm.c                    |    3 +-
 drivers/gpu/drm/nouveau/Makefile            |    2 +-
 drivers/gpu/drm/nouveau/nouveau_backlight.c |    5 +
 drivers/gpu/drm/nouveau/nouveau_bo.c        |    1 +
 drivers/gpu/drm/nouveau/nouveau_object.c    |    1 +
 drivers/gpu/drm/nouveau/nouveau_sgdma.c     |    1 +
 drivers/gpu/drm/nouveau/nouveau_state.c     |    5 +
 21 files changed, 587 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 97aa0c8..6a937dd 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -12,6 +12,7 @@ drm-y       :=	drm_auth.o drm_bufs.o drm_cache.o \
 		drm_sysfs.o drm_hashtab.o drm_sman.o drm_mm.o \
 		drm_crtc.o drm_crtc_helper.o drm_modes.o drm_edid.o \
 		drm_info.o drm_debugfs.o \
+		drm_compat.o \
 		drm_fence.o drm_bo.o drm_ttm.o drm_bo_move.o drm_page_alloc.o
 
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
@@ -27,5 +28,5 @@ obj-$(CONFIG_DRM_I915)  += i915/
 obj-$(CONFIG_DRM_SIS)   += sis/
 obj-$(CONFIG_DRM_SAVAGE)+= savage/
 obj-$(CONFIG_DRM_VIA)	+=via/
-obj-$(CONFIG_DRM_NOUVEAU) +=nouveau/
+obj-m +=nouveau/
 
diff --git a/drivers/gpu/drm/ati_pcigart.c b/drivers/gpu/drm/ati_pcigart.c
index e7dc671..597f4ef 100644
--- a/drivers/gpu/drm/ati_pcigart.c
+++ b/drivers/gpu/drm/ati_pcigart.c
@@ -32,6 +32,7 @@
  */
 
 #include "drmP.h"
+#include "drm_compat.h"
 
 # define ATI_PCIGART_PAGE_SIZE		4096	/**< PCI GART page size */
 # define ATI_PCIGART_PAGE_MASK		(~(ATI_PCIGART_PAGE_SIZE-1))
diff --git a/drivers/gpu/drm/drm_agpsupport.c b/drivers/gpu/drm/drm_agpsupport.c
index 851f4c3..a7bc525 100644
--- a/drivers/gpu/drm/drm_agpsupport.c
+++ b/drivers/gpu/drm/drm_agpsupport.c
@@ -32,6 +32,7 @@
  */
 
 #include "drmP.h"
+#include "drm_compat.h"
 #include <linux/module.h>
 
 #if __OS_HAS_AGP
diff --git a/drivers/gpu/drm/drm_bo.c b/drivers/gpu/drm/drm_bo.c
index 371db56..19b50fc 100644
--- a/drivers/gpu/drm/drm_bo.c
+++ b/drivers/gpu/drm/drm_bo.c
@@ -511,7 +511,7 @@ static void drm_bo_delayed_delete(struct drm_device *dev, int remove_all)
 		entry = list_entry(list, struct drm_buffer_object, ddestroy);
 
 		nentry = NULL;
-		DRM_DEBUG("bo is %p, %d\n", entry, entry->num_pages);
+		DRM_DEBUG("bo is %p, %lu\n", entry, entry->num_pages);
 		if (next != &bm->ddestroy) {
 			nentry = list_entry(next, struct drm_buffer_object,
 					    ddestroy);
@@ -1265,7 +1265,7 @@ static int drm_buffer_object_validate(struct drm_buffer_object *bo,
 					 move_unfenced);
 		if (ret) {
 			if (ret != -EAGAIN)
-				DRM_ERROR("Failed moving buffer. %p %d %llx %llx\n", bo, bo->num_pages, bo->mem.proposed_flags, bo->mem.flags );
+				DRM_ERROR("Failed moving buffer. %p %lu %llx %llx\n", bo, bo->num_pages, bo->mem.proposed_flags, bo->mem.flags );
 			if (ret == -ENOMEM)
 				DRM_ERROR("Out of aperture space or "
 					  "DRM memory quota.\n");
diff --git a/drivers/gpu/drm/drm_bo_move.c b/drivers/gpu/drm/drm_bo_move.c
index abeab6a..fe9d635 100644
--- a/drivers/gpu/drm/drm_bo_move.c
+++ b/drivers/gpu/drm/drm_bo_move.c
@@ -29,8 +29,9 @@
  */
 
 #include "drmP.h"
+#include "drm_compat.h"
 
-#if defined(CONFIG_X86)
+#if defined(CONFIG_X86) && (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,26))
 #include <asm/pat.h>
 #endif
 
diff --git a/drivers/gpu/drm/drm_compat.c b/drivers/gpu/drm/drm_compat.c
new file mode 100644
index 0000000..9b8a3e8
--- /dev/null
+++ b/drivers/gpu/drm/drm_compat.c
@@ -0,0 +1,267 @@
+/**************************************************************************
+ *
+ * This kernel module is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of the
+ * License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *
+ **************************************************************************/
+/*
+ * This code provides access to unexported mm kernel features. It is necessary
+ * to use the new DRM memory manager code with kernels that don't support it
+ * directly.
+ *
+ * Authors: Thomas Hellstrom <thomas-at-tungstengraphics-dot-com>
+ *          Linux kernel mm subsystem authors.
+ *          (Most code taken from there).
+ */
+
+#include "drmP.h"
+#include "drm_compat.h"
+
+#ifdef DRM_IDR_COMPAT_FN
+/* only called when idp->lock is held */
+static void __free_layer(struct idr *idp, struct idr_layer *p)
+{
+	p->ary[0] = idp->id_free;
+	idp->id_free = p;
+	idp->id_free_cnt++;
+}
+
+static void free_layer(struct idr *idp, struct idr_layer *p)
+{
+	unsigned long flags;
+
+	/*
+	 * Depends on the return element being zeroed.
+	 */
+	spin_lock_irqsave(&idp->lock, flags);
+	__free_layer(idp, p);
+	spin_unlock_irqrestore(&idp->lock, flags);
+}
+
+/**
+ * idr_for_each - iterate through all stored pointers
+ * @idp: idr handle
+ * @fn: function to be called for each pointer
+ * @data: data passed back to callback function
+ *
+ * Iterate over the pointers registered with the given idr.  The
+ * callback function will be called for each pointer currently
+ * registered, passing the id, the pointer and the data pointer passed
+ * to this function.  It is not safe to modify the idr tree while in
+ * the callback, so functions such as idr_get_new and idr_remove are
+ * not allowed.
+ *
+ * We check the return of @fn each time. If it returns anything other
+ * than 0, we break out and return that value.
+ *
+* The caller must serialize idr_find() vs idr_get_new() and idr_remove().
+ */
+int idr_for_each(struct idr *idp,
+		 int (*fn)(int id, void *p, void *data), void *data)
+{
+	int n, id, max, error = 0;
+	struct idr_layer *p;
+	struct idr_layer *pa[MAX_LEVEL];
+	struct idr_layer **paa = &pa[0];
+
+	n = idp->layers * IDR_BITS;
+	p = idp->top;
+	max = 1 << n;
+
+	id = 0;
+	while (id < max) {
+		while (n > 0 && p) {
+			n -= IDR_BITS;
+			*paa++ = p;
+			p = p->ary[(id >> n) & IDR_MASK];
+		}
+
+		if (p) {
+			error = fn(id, (void *)p, data);
+			if (error)
+				break;
+		}
+
+		id += 1 << n;
+		while (n < fls(id)) {
+			n += IDR_BITS;
+			p = *--paa;
+		}
+	}
+
+	return error;
+}
+EXPORT_SYMBOL(idr_for_each);
+
+/**
+ * idr_remove_all - remove all ids from the given idr tree
+ * @idp: idr handle
+ *
+ * idr_destroy() only frees up unused, cached idp_layers, but this
+ * function will remove all id mappings and leave all idp_layers
+ * unused.
+ *
+ * A typical clean-up sequence for objects stored in an idr tree, will
+ * use idr_for_each() to free all objects, if necessay, then
+ * idr_remove_all() to remove all ids, and idr_destroy() to free
+ * up the cached idr_layers.
+ */
+void idr_remove_all(struct idr *idp)
+{
+       int n, id, max, error = 0;
+       struct idr_layer *p;
+       struct idr_layer *pa[MAX_LEVEL];
+       struct idr_layer **paa = &pa[0];
+
+       n = idp->layers * IDR_BITS;
+       p = idp->top;
+       max = 1 << n;
+
+       id = 0;
+       while (id < max && !error) {
+               while (n > IDR_BITS && p) {
+                       n -= IDR_BITS;
+                       *paa++ = p;
+                       p = p->ary[(id >> n) & IDR_MASK];
+               }
+
+               id += 1 << n;
+               while (n < fls(id)) {
+                       if (p) {
+                               memset(p, 0, sizeof *p);
+                               free_layer(idp, p);
+                       }
+                       n += IDR_BITS;
+                       p = *--paa;
+               }
+       }
+       idp->top = NULL;
+       idp->layers = 0;
+}
+EXPORT_SYMBOL(idr_remove_all);
+
+#endif /* DRM_IDR_COMPAT_FN */
+
+
+#ifdef DRM_NO_FAULT
+unsigned long drm_bo_vm_nopfn(struct vm_area_struct *vma,
+			      unsigned long address)
+{
+	struct drm_buffer_object *bo = (struct drm_buffer_object *) vma->vm_private_data;
+	unsigned long page_offset;
+	struct page *page = NULL;
+	struct drm_ttm *ttm;
+	struct drm_device *dev;
+	unsigned long pfn;
+	int err;
+	unsigned long bus_base;
+	unsigned long bus_offset;
+	unsigned long bus_size;
+	unsigned long ret = NOPFN_REFAULT;
+
+	if (address > vma->vm_end)
+		return NOPFN_SIGBUS;
+
+	dev = bo->dev;
+	err = drm_bo_read_lock(&dev->bm.bm_lock, 1);
+	if (err)
+		return NOPFN_REFAULT;
+
+	err = mutex_lock_interruptible(&bo->mutex);
+	if (err) {
+		drm_bo_read_unlock(&dev->bm.bm_lock);
+		return NOPFN_REFAULT;
+	}
+
+	err = drm_bo_wait(bo, 0, 1, 0, 1);
+	if (err) {
+		ret = (err != -EAGAIN) ? NOPFN_SIGBUS : NOPFN_REFAULT;
+		bo->priv_flags &= ~_DRM_BO_FLAG_UNLOCKED;
+		goto out_unlock;
+	}
+
+	bo->priv_flags &= ~_DRM_BO_FLAG_UNLOCKED;
+
+	/*
+	 * If buffer happens to be in a non-mappable location,
+	 * move it to a mappable.
+	 */
+
+	if (!(bo->mem.flags & DRM_BO_FLAG_MAPPABLE)) {
+		uint32_t new_flags = bo->mem.proposed_flags |
+			DRM_BO_FLAG_MAPPABLE |
+			DRM_BO_FLAG_FORCE_MAPPABLE;
+		err = drm_bo_move_buffer(bo, new_flags, 0, 0);
+		if (err) {
+			ret = (err != -EAGAIN) ? NOPFN_SIGBUS : NOPFN_REFAULT;
+			goto out_unlock;
+		}
+	}
+
+	err = drm_bo_pci_offset(dev, &bo->mem, &bus_base, &bus_offset,
+				&bus_size);
+
+	if (err) {
+		ret = NOPFN_SIGBUS;
+		goto out_unlock;
+	}
+
+	page_offset = (address - vma->vm_start) >> PAGE_SHIFT;
+
+	if (bus_size) {
+		struct drm_mem_type_manager *man = &dev->bm.man[bo->mem.mem_type];
+
+		pfn = ((bus_base + bus_offset) >> PAGE_SHIFT) + page_offset;
+		vma->vm_page_prot = drm_io_prot(man->drm_bus_maptype, vma);
+	} else {
+		ttm = bo->ttm;
+
+		drm_ttm_fixup_caching(ttm);
+		page = drm_ttm_get_page(ttm, page_offset);
+		if (!page) {
+			ret = NOPFN_OOM;
+			goto out_unlock;
+		}
+		pfn = page_to_pfn(page);
+		vma->vm_page_prot = (bo->mem.flags & DRM_BO_FLAG_CACHED) ?
+			vm_get_page_prot(vma->vm_flags) :
+			drm_io_prot(_DRM_TTM, vma);
+	}
+
+	err = vm_insert_pfn(vma, address, pfn);
+	if (err) {
+		ret = (err != -EAGAIN) ? NOPFN_OOM : NOPFN_REFAULT;
+		goto out_unlock;
+	}
+out_unlock:
+	BUG_ON(bo->priv_flags & _DRM_BO_FLAG_UNLOCKED);
+	mutex_unlock(&bo->mutex);
+	drm_bo_read_unlock(&dev->bm.bm_lock);
+	return ret;
+}
+#endif
+
+#ifdef DRM_COMPAT_NEEDS_DEV_SET_NAME
+int dev_set_name(struct device *dev, const char *fmt, ...)
+{
+        va_list vargs;
+        char *s;
+        va_start(vargs, fmt);
+        vsnprintf(dev->bus_id, sizeof(dev->bus_id), fmt, vargs);
+        va_end(vargs);
+        while ((s = strchr(dev->bus_id, '/')))
+                *s = '!';
+        return 0;
+}
+#endif
diff --git a/drivers/gpu/drm/drm_compat.h b/drivers/gpu/drm/drm_compat.h
new file mode 100644
index 0000000..01a7671
--- /dev/null
+++ b/drivers/gpu/drm/drm_compat.h
@@ -0,0 +1,289 @@
+/**
+ * \file drm_compat.h
+ * Backward compatability definitions for Direct Rendering Manager
+ *
+ * \author Rickard E. (Rik) Faith <faith-jCdQPDEk3idBDgjK7y7TUQ@public.gmane.org>
+ * \author Gareth Hughes <gareth-jCdQPDEk3idBDgjK7y7TUQ@public.gmane.org>
+ */
+
+/*
+ * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
+ * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
+ * All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef _DRM_COMPAT_H_
+#define _DRM_COMPAT_H_
+
+#include <linux/version.h>
+
+#ifndef minor
+#define minor(x) MINOR((x))
+#endif
+
+#ifndef MODULE_LICENSE
+#define MODULE_LICENSE(x)
+#endif
+
+#ifndef preempt_disable
+#define preempt_disable()
+#define preempt_enable()
+#endif
+
+#ifndef pte_offset_map
+#define pte_offset_map pte_offset
+#define pte_unmap(pte)
+#endif
+
+#ifndef module_param
+#define module_param(name, type, perm)
+#endif
+
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,6,27))
+#define current_euid() (current->euid)
+#else
+#include <linux/cred.h>
+#endif
+
+#ifndef list_for_each_safe
+#define list_for_each_safe(pos, n, head)				\
+	for (pos = (head)->next, n = pos->next; pos != (head);		\
+		pos = n, n = pos->next)
+#endif
+
+#ifndef list_for_each_entry
+#define list_for_each_entry(pos, head, member)				\
+       for (pos = list_entry((head)->next, typeof(*pos), member),	\
+                    prefetch(pos->member.next);				\
+            &pos->member != (head);					\
+            pos = list_entry(pos->member.next, typeof(*pos), member),	\
+                    prefetch(pos->member.next))
+#endif
+
+#ifndef list_for_each_entry_safe
+#define list_for_each_entry_safe(pos, n, head, member)                  \
+        for (pos = list_entry((head)->next, typeof(*pos), member),      \
+                n = list_entry(pos->member.next, typeof(*pos), member); \
+             &pos->member != (head);                                    \
+             pos = n, n = list_entry(n->member.next, typeof(*n), member))
+#endif
+
+#ifndef __user
+#define __user
+#endif
+
+#if !defined(__put_page)
+#define __put_page(p)           atomic_dec(&(p)->count)
+#endif
+
+#if !defined(__GFP_COMP)
+#define __GFP_COMP 0
+#endif
+
+#if !defined(IRQF_SHARED)
+#define IRQF_SHARED SA_SHIRQ
+#endif
+
+#ifndef DEFINE_SPINLOCK
+#define DEFINE_SPINLOCK(x) spinlock_t x = SPIN_LOCK_UNLOCKED
+#endif
+
+/* old architectures */
+#ifdef __AMD64__
+#define __x86_64__
+#endif
+
+/* sysfs __ATTR macro */
+#ifndef __ATTR
+#define __ATTR(_name,_mode,_show,_store) { \
+        .attr = {.name = __stringify(_name), .mode = _mode, .owner = THIS_MODULE },     \
+        .show   = _show,                                        \
+        .store  = _store,                                       \
+}
+#endif
+
+#ifndef list_for_each_entry_safe_reverse
+#define list_for_each_entry_safe_reverse(pos, n, head, member)          \
+        for (pos = list_entry((head)->prev, typeof(*pos), member),      \
+                n = list_entry(pos->member.prev, typeof(*pos), member); \
+             &pos->member != (head);                                    \
+             pos = n, n = list_entry(n->member.prev, typeof(*n), member))
+#endif
+
+#include <linux/mm.h>
+#include <asm/page.h>
+
+/*
+ * Flush relevant caches and clear a VMA structure so that page references
+ * will cause a page fault. Don't flush tlbs.
+ */
+
+extern void drm_clear_vma(struct vm_area_struct *vma,
+			  unsigned long addr, unsigned long end);
+
+/*
+ * Return the PTE protection map entries for the VMA flags given by
+ * flags. This is a functional interface to the kernel's protection map.
+ */
+
+extern pgprot_t vm_get_page_prot(unsigned long vm_flags);
+
+#ifndef GFP_DMA32
+#define GFP_DMA32 GFP_KERNEL
+#endif
+#ifndef __GFP_DMA32
+#define __GFP_DMA32 GFP_KERNEL
+#endif
+
+/* fixme when functions are upstreamed - upstreamed for 2.6.23 */
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,6,23))
+#define DRM_IDR_COMPAT_FN
+#define DRM_NO_FAULT
+extern unsigned long drm_bo_vm_nopfn(struct vm_area_struct *vma,
+				     unsigned long address);
+#endif
+#ifdef DRM_IDR_COMPAT_FN
+int idr_for_each(struct idr *idp,
+		 int (*fn)(int id, void *p, void *data), void *data);
+void idr_remove_all(struct idr *idp);
+#endif
+
+
+#if !defined(flush_agp_mappings)
+#define flush_agp_mappings() do {} while(0)
+#endif
+
+#ifndef DMA_BIT_MASK
+#define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : (1ULL<<(n)) - 1)
+#endif
+
+#ifndef VM_CAN_NONLINEAR
+#define DRM_VM_NOPAGE 1
+#endif
+
+#ifdef DRM_VM_NOPAGE
+
+extern struct page *drm_vm_nopage(struct vm_area_struct *vma,
+				  unsigned long address, int *type);
+
+extern struct page *drm_vm_shm_nopage(struct vm_area_struct *vma,
+				      unsigned long address, int *type);
+
+extern struct page *drm_vm_dma_nopage(struct vm_area_struct *vma,
+				      unsigned long address, int *type);
+
+extern struct page *drm_vm_sg_nopage(struct vm_area_struct *vma,
+				     unsigned long address, int *type);
+#endif
+
+#ifndef OS_HAS_GEM
+#if (LINUX_VERSION_CODE > KERNEL_VERSION(2,6,27))
+#define OS_HAS_GEM 1
+#else
+#define OS_HAS_GEM 0
+#endif
+#endif
+
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,6,27))
+#define set_page_locked SetPageLocked
+#elif (LINUX_VERSION_CODE > KERNEL_VERSION(2,6,27))
+/*
+ * The kernel provides __set_page_locked, which uses the non-atomic
+ * __set_bit function. Let's use the atomic set_bit just in case.
+ */
+static inline void set_page_locked(struct page *page)
+{
+	set_bit(PG_locked, &page->flags);
+}
+#endif
+
+#ifndef VM_NORESERVE
+/* Just ignore this flag, if it is not available in kernel. */
+#define VM_NORESERVE 0
+#endif
+
+#ifndef _PAGE_CACHE_WC
+/* Just ignore this flag, if it is not available in kernel. */
+#define _PAGE_CACHE_WC 0
+#endif
+
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,6,25))
+static inline void agp_flush_chipset(struct agp_bridge_data *bridge)
+{
+	/* This should break only Intel stuff. */
+	(void)bridge;
+}
+
+static inline int set_memory_uc(unsigned long addr, int numpages)
+{
+	(void)addr, (void)numpages;
+	return 0;
+}
+
+static inline int set_memory_wb(unsigned long addr, int numpages)
+{
+	(void)addr, (void)numpages;
+	return 0;
+}
+
+static inline int set_memory_wc(unsigned long addr, int numpages)
+{
+	(void)addr, (void)numpages;
+	return 0;
+}
+#endif
+
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,6,26))
+static inline void __iomem *ioremap_wc(unsigned long phys_addr,
+						unsigned long size)
+{
+	return ioremap(phys_addr, size);
+}
+
+#define VM_MIXEDMAP VM_PFNMAP
+static inline int vm_insert_mixed(struct vm_area_struct *vma,
+				unsigned long addr, unsigned long pfn)
+{
+	return vm_insert_pfn(vma, addr, pfn);
+}
+
+#define DRM_COMPAT_NEEDS_DEV_SET_NAME 1
+int dev_set_name(struct device *dev, const char *fmt, ...);
+#endif
+
+#ifndef WARN
+#define WARN(condition, format...) WARN_ON(condition)
+#endif
+
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,6,27))
+#define dma_mapping_error(dev, addr) dma_mapping_error(addr)
+#define pci_dma_mapping_error(dev, addr) pci_dma_mapping_error(addr)
+#endif
+
+#ifndef upper_32_bits
+#define upper_32_bits(n) ((u32)(((n) >> 16) >> 16))
+#endif
+#ifndef lower_32_bits
+#define lower_32_bits(n) ((u32)(n))
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 3b78927..d30087c 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -30,6 +30,7 @@
  */
 
 #include "drmP.h"
+#include "drm_compat.h"
 #include "drm_crtc.h"
 #include "drm_crtc_helper.h"
 
diff --git a/drivers/gpu/drm/drm_fops.c b/drivers/gpu/drm/drm_fops.c
index 4f1a405..1b6089b 100644
--- a/drivers/gpu/drm/drm_fops.c
+++ b/drivers/gpu/drm/drm_fops.c
@@ -35,6 +35,7 @@
  */
 
 #include "drmP.h"
+#include "drm_compat.h"
 #include <linux/poll.h>
 #include <linux/smp_lock.h>
 
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 2e4e667..61403f1 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -35,6 +35,7 @@
 #include <linux/mman.h>
 #include <linux/pagemap.h>
 #include "drmP.h"
+#include "drm_compat.h"
 
 /** @file drm_gem.c
  *
diff --git a/drivers/gpu/drm/drm_memory.c b/drivers/gpu/drm/drm_memory.c
index 4942f9d..19ee7ab 100644
--- a/drivers/gpu/drm/drm_memory.c
+++ b/drivers/gpu/drm/drm_memory.c
@@ -35,6 +35,7 @@
 
 #include <linux/highmem.h>
 #include "drmP.h"
+#include "drm_compat.h"
 
 
 static struct {
diff --git a/drivers/gpu/drm/drm_page_alloc.c b/drivers/gpu/drm/drm_page_alloc.c
index fad6ae3..83d63d8 100644
--- a/drivers/gpu/drm/drm_page_alloc.c
+++ b/drivers/gpu/drm/drm_page_alloc.c
@@ -32,6 +32,7 @@
  */
 
 #include "drmP.h"
+#include "drm_compat.h"
 #include <asm/agp.h>
 
 #include "drm_page_alloc.h"
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index f7510a8..bd9d57d 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -18,6 +18,7 @@
 
 #include "drm_core.h"
 #include "drmP.h"
+#include "drm_compat.h"
 
 #define to_drm_minor(d) container_of(d, struct drm_minor, kdev)
 #define to_drm_connector(d) container_of(d, struct drm_connector, kdev)
diff --git a/drivers/gpu/drm/drm_ttm.c b/drivers/gpu/drm/drm_ttm.c
index ec5f140..cfc829b 100644
--- a/drivers/gpu/drm/drm_ttm.c
+++ b/drivers/gpu/drm/drm_ttm.c
@@ -29,6 +29,7 @@
  */
 
 #include "drmP.h"
+#include "drm_compat.h"
 #include <asm/agp.h>
 
 /**
diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
index 9443402..26caec9 100644
--- a/drivers/gpu/drm/drm_vm.c
+++ b/drivers/gpu/drm/drm_vm.c
@@ -34,10 +34,11 @@
  */
 
 #include "drmP.h"
+#include "drm_compat.h"
 #if defined(__ia64__)
 #include <linux/efi.h>
 #endif
-#if defined(CONFIG_X86)
+#if defined(CONFIG_X86) && (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,26))
 #include <asm/pat.h>
 #endif
 
diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index 12af41b..4bb91c6 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -21,4 +21,4 @@ nouveau-y := nouveau_drv.o nouveau_state.o nouveau_fifo.o nouveau_mem.o \
 
 nouveau-$(CONFIG_COMPAT) += nouveau_ioc32.o
 
-obj-$(CONFIG_DRM_NOUVEAU)+= nouveau.o
+obj-m += nouveau.o
diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index 3fc521e..865440f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -31,6 +31,7 @@
  */
 
 #include <linux/backlight.h>
+#include <linux/version.h>
 
 #include "drmP.h"
 #include "nouveau_drv.h"
@@ -60,7 +61,9 @@ static int nv40_set_intensity(struct backlight_device *bd)
 }
 
 static struct backlight_ops nv40_bl_ops = {
+#if (LINUX_VERSION_CODE > KERNEL_VERSION(2,6,28))
 	.options = BL_CORE_SUSPENDRESUME,
+#endif
 	.get_brightness = nv40_get_intensity,
 	.update_status = nv40_set_intensity,
 };
@@ -85,7 +88,9 @@ static int nv50_set_intensity(struct backlight_device *bd)
 }
 
 static struct backlight_ops nv50_bl_ops = {
+#if (LINUX_VERSION_CODE > KERNEL_VERSION(2,6,28))
 	.options = BL_CORE_SUSPENDRESUME,
+#endif
 	.get_brightness = nv50_get_intensity,
 	.update_status = nv50_set_intensity,
 };
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index dc52670..30f45d4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -31,6 +31,7 @@
 #include "nouveau_drm.h"
 #include "nouveau_drv.h"
 #include "nouveau_dma.h"
+#include "../drm_compat.h"
 
 static struct drm_ttm_backend *
 nouveau_bo_create_ttm_backend_entry(struct drm_device * dev)
diff --git a/drivers/gpu/drm/nouveau/nouveau_object.c b/drivers/gpu/drm/nouveau/nouveau_object.c
index 068797b..b74e94f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_object.c
+++ b/drivers/gpu/drm/nouveau/nouveau_object.c
@@ -34,6 +34,7 @@
 #include "drm.h"
 #include "nouveau_drv.h"
 #include "nouveau_drm.h"
+#include "../drm_compat.h"
 
 /* NVidia uses context objects to drive drawing operations.
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
index 3be7235..b7861e9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
@@ -1,6 +1,7 @@
 #include "drmP.h"
 #include "nouveau_drv.h"
 #include <linux/pagemap.h>
+#include "../drm_compat.h"
 
 #define NV_CTXDMA_PAGE_SHIFT 12
 #define NV_CTXDMA_PAGE_SIZE  (1 << NV_CTXDMA_PAGE_SHIFT)
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index 2988664..91c393a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -23,7 +23,12 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/version.h>
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,6,27))
+#include <asm/byteorder.h>
+#else
 #include <linux/swab.h>
+#endif
 
 #include "drmP.h"
 #include "drm.h"

--MP_/L=_nin3SmR/KJS+OW.pNo6z
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=kernel-compat-24.patch

--- mm/shmem-orig.c	2009-03-19 22:38:36.000000000 +0200
+++ mm/shmem.c	2009-03-19 22:52:05.000000000 +0200
@@ -2562,6 +2562,7 @@ put_memory:
 	shmem_unacct_size(flags, size);
 	return ERR_PTR(error);
 }
+EXPORT_SYMBOL_GPL(shmem_file_setup);
 
 /*
  * shmem_zero_setup - setup a shared anonymous mapping

--MP_/L=_nin3SmR/KJS+OW.pNo6z
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--MP_/L=_nin3SmR/KJS+OW.pNo6z--

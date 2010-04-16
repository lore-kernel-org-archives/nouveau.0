From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Blank screen at startup (conflict with VESA VGA)
Date: Fri, 16 Apr 2010 19:19:19 +0200
Message-ID: <20100416171919.GA3388@joi.lan>
References: <20100411170535.GA4016@joi.lan> <4BC2231C.2060509@epsm.fr>
	<4BC2BA76.8040509@epsm.fr> <20100412101413.GA2733@joi.lan>
	<4BC2F69E.6000905@epsm.fr> <20100412105013.GA2789@joi.lan>
	<20100412200458.0380a4fe@daedalus.pq.iki.fi>
	<1271121328.3035.2.camel@Spike> <20100413113451.GA10009@joi.lan>
	<20100415201941.GA20030@soprano.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100415201941.GA20030-J3EY2hv0KmgMOYszX5p1ytBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Aaron Plattner <aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Christopher James Halse Rogers <raof-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Apr 15, 2010 at 01:19:41PM -0700, Aaron Plattner wrote:
> On Tue, Apr 13, 2010 at 04:34:51AM -0700, Marcin Slusarz wrote:
> > On Tue, Apr 13, 2010 at 11:15:28AM +1000, Christopher James Halse Rogers wrote:
> > > On Mon, 2010-04-12 at 20:04 +0300, Pekka Paalanen wrote:
> > > > On Mon, 12 Apr 2010 12:50:13 +0200
> > > > Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > > > 
> > > > > I'm not aware of any trick to make both nv and nouveau working.
> > > > > Maybe there should be a way to prevent nv (and vesa, but not
> > > > > fbdev) from loading when KMS is in use?
> > > > 
> > > > Yeah, there was a brief discussion about that recently:
> > > > http://people.freedesktop.org/~cbrill/dri-log/index.php?date=2010-03-21&channel=nouveau&show_html=true&highlight_names=&update=Update&date=2010-03-21
> > > > 
> > > > I haven't heard anything about it since.
> > > > 
> > > 
> > > I wrote a patch for vesa on bugzilla[1] to do exactly that; a similar
> > > one for nv wouldn't be hard.
> > > 
> > > [1] https://bugs.freedesktop.org/show_bug.cgi?id=26878
> > 
> > Yay, thanks.
> > I adapted it to xf86-video-nv and it works!
> > Now we need to trick Aaron to apply it.
> > 
> > Aaron: please, please, please apply.
> > :)
> 
> Sorry for the slow reply.  It sucks that this is necessary, but I guess it
> makes sense.  Comments below.

Thanks for a reply!

> > ---
> > From 112a8c9aa9de6ea30b4c3c98e5d7cbce312aaaf8 Mon Sep 17 00:00:00 2001
> > From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Date: Tue, 13 Apr 2010 13:17:56 +0200
> > Subject: [PATCH] Refuse to bind to a device which has kernel modesetting active.
> > 
> > Touching directly the hardware while kernel modesetting is active
> > breaks console output.
> > 
> > Patch almost entrirely based on VESA patch by
> > Christopher James Halse Rogers <christopher.halse.rogers-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> > 
> > Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  configure.ac    |   11 +++++++++++
> >  src/Makefile.am |    2 +-
> >  src/nv_driver.c |   33 +++++++++++++++++++++++++++++++++
> >  3 files changed, 45 insertions(+), 1 deletions(-)
> > 
> > diff --git a/configure.ac b/configure.ac
> > index d717805..3028005 100644
> > --- a/configure.ac
> > +++ b/configure.ac
> > @@ -134,6 +134,17 @@ AC_SUBST([modes_dir])
> >  AC_SUBST([XORG_CFLAGS])
> >  AC_SUBST([moduledir])
> >  
> > +if test "x$XSERVER_LIBPCIACCESS" = xyes; then
> > +    PKG_CHECK_MODULES(LIBDRM, [libdrm > 2.4.3 xf86driproto], HAVE_KMS="yes", HAVE_KMS="no")
> > +    if test "x$HAVE_KMS" = xyes; then
> > +        AC_DEFINE(HAVE_KMS, 1, [Have kernel modesetting])
> > +    else
> > +        AC_MSG_WARN(Support for detecting kernel modesetting drivers is not available.)
> > +        AC_MSG_WARN(This driver can cause display problems in the presence of kernel modesetting.)
> > +        AC_MSG_WARN(Please install libdrm > 2.4.3 and xf86driproto to enable kms detection.)
> 
> s/kms/KMS/

done

> > +    fi
> > +fi
> > +
> >  DRIVER_NAME=nv
> >  AC_SUBST([DRIVER_NAME])
> >  
> > diff --git a/src/Makefile.am b/src/Makefile.am
> > index 2677d9c..5d57010 100644
> > --- a/src/Makefile.am
> > +++ b/src/Makefile.am
> > @@ -23,7 +23,7 @@
> >  # -avoid-version prevents gratuitous .0.0.0 version numbers on the end
> >  # _ladir passes a dummy rpath to libtool so the thing will actually link
> >  # TODO: -nostdlib/-Bstatic/-lgcc platform magic, not installing the .a, etc.
> > -AM_CFLAGS = @XMODES_CFLAGS@ @XORG_CFLAGS@
> > +AM_CFLAGS = @XMODES_CFLAGS@ @XORG_CFLAGS@ $(LIBDRM_CFLAGS)
> >  nv_drv_la_LTLIBRARIES = nv_drv.la
> >  nv_drv_la_LDFLAGS = -module -avoid-version
> >  nv_drv_ladir = @moduledir@/drivers
> > diff --git a/src/nv_driver.c b/src/nv_driver.c
> > index 0d017f9..e117626 100644
> > --- a/src/nv_driver.c
> > +++ b/src/nv_driver.c
> > @@ -33,6 +33,11 @@
> >  #include "xf86int10.h"
> >  #include "vbeModes.h"
> >  
> > +#ifdef HAVE_KMS
> > +#include <xf86drmMode.h>
> > +#include <dri.h>
> > +#endif
> > +
> >  const   OptionInfoRec * RivaAvailableOptions(int chipid, int busid);
> >  Bool    RivaGetScrnInfoRec(PciChipsets *chips, int chip);
> >  Bool    G80GetScrnInfoRec(PciChipsets *chips, int chip);
> > @@ -830,6 +835,26 @@ NVIsSupported(CARD32 id)
> >      return FALSE;
> >  }
> >  
> > +#ifdef HAVE_KMS
> > +static Bool NVKernelModesettingEnabled (struct pci_device *device)
> > +{
> > +    char *busIdString;
> > +    int ret;
> > +
> > +    if (!xf86LoaderCheckSymbol("DRICreatePCIBusID"))
> > +	return FALSE;
> 
> I know the rest of the code uses tabs, but please use spaces for new code.

ok

> > +
> > +    busIdString = DRICreatePCIBusID(device);
> 
> Eww.  Why doesn't drmCheckModesettingSupported take a pci_device*?  Oh
> well, whatever.

That's how it was done from the beginning - drmCheckModesettingSupported parses busIdString
and reads some files in /sys based on this information...

> > +    ret = drmCheckModesettingSupported(busIdString);
> 
> There's no chance of false positives here, right?  E.g. if you set
> nouveau.modeset=0 on the kernel command line, does that make this return
> nonzero?

With nouveau.modeset=0 it returns nonzero and nv works fine.

> > +    xfree(busIdString);
> > +
> > +    return (ret == 0);
> > +}
> > +#else
> > +static inline Bool NVKernelModesettingEnabled (struct pci_device *device) { return FALSE; }
> > +#endif //HAVE_KMS
> > +
> >  /* Mandatory */
> >  #if XSERVER_LIBPCIACCESS
> >  static Bool
> > @@ -864,6 +889,14 @@ NVPciProbe(DriverPtr drv, int entity, struct pci_device *dev, intptr_t data)
> >                 NV_NAME ": Found NVIDIA %s at %2.2x@%2.2x:%2.2x:%1.1x\n",
> >                 name, dev->bus, dev->domain, dev->dev, dev->func);
> >  
> > +    /* Trying to bring up a NV mode while kernel modesetting is enabled
> > +       results in badness */
> > +    if (NVKernelModesettingEnabled (dev)) {
> > +	xf86Msg (X_ERROR,
> > +	         "NV: Kernel modesetting driver in use, refusing to load\n");
> 
> Please use NV_NAME instead of hard-coding the "NV:" prefix.

done

> > +	return FALSE;
> > +    }
> > +
> >      if(NVIsG80(id))
> >          return G80GetScrnInfoRec(NULL, entity);
> >      else if(dev->vendor_id == PCI_VENDOR_NVIDIA_SGS)
> > -- 
> > 1.7.0.4

---
From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Refuse to bind to a device which has kernel modesetting active.

Touching directly the hardware while kernel modesetting is active
breaks console output.

Patch almost entrirely based on VESA patch by
Christopher James Halse Rogers <christopher.halse.rogers-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 configure.ac    |   11 +++++++++++
 src/Makefile.am |    2 +-
 src/nv_driver.c |   33 +++++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 1 deletions(-)

diff --git a/configure.ac b/configure.ac
index d717805..c51ab4a 100644
--- a/configure.ac
+++ b/configure.ac
@@ -134,6 +134,17 @@ AC_SUBST([modes_dir])
 AC_SUBST([XORG_CFLAGS])
 AC_SUBST([moduledir])
 
+if test "x$XSERVER_LIBPCIACCESS" = xyes; then
+    PKG_CHECK_MODULES(LIBDRM, [libdrm > 2.4.3 xf86driproto], HAVE_KMS="yes", HAVE_KMS="no")
+    if test "x$HAVE_KMS" = xyes; then
+        AC_DEFINE(HAVE_KMS, 1, [Have kernel modesetting])
+    else
+        AC_MSG_WARN(Support for detecting kernel modesetting drivers is not available.)
+        AC_MSG_WARN(This driver can cause display problems in the presence of kernel modesetting.)
+        AC_MSG_WARN(Please install libdrm > 2.4.3 and xf86driproto to enable KMS detection.)
+    fi
+fi
+
 DRIVER_NAME=nv
 AC_SUBST([DRIVER_NAME])
 
diff --git a/src/Makefile.am b/src/Makefile.am
index 2677d9c..5d57010 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -23,7 +23,7 @@
 # -avoid-version prevents gratuitous .0.0.0 version numbers on the end
 # _ladir passes a dummy rpath to libtool so the thing will actually link
 # TODO: -nostdlib/-Bstatic/-lgcc platform magic, not installing the .a, etc.
-AM_CFLAGS = @XMODES_CFLAGS@ @XORG_CFLAGS@
+AM_CFLAGS = @XMODES_CFLAGS@ @XORG_CFLAGS@ $(LIBDRM_CFLAGS)
 nv_drv_la_LTLIBRARIES = nv_drv.la
 nv_drv_la_LDFLAGS = -module -avoid-version
 nv_drv_ladir = @moduledir@/drivers
diff --git a/src/nv_driver.c b/src/nv_driver.c
index 0d017f9..d7cc963 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -33,6 +33,11 @@
 #include "xf86int10.h"
 #include "vbeModes.h"
 
+#ifdef HAVE_KMS
+#include <xf86drmMode.h>
+#include <dri.h>
+#endif
+
 const   OptionInfoRec * RivaAvailableOptions(int chipid, int busid);
 Bool    RivaGetScrnInfoRec(PciChipsets *chips, int chip);
 Bool    G80GetScrnInfoRec(PciChipsets *chips, int chip);
@@ -830,6 +835,26 @@ NVIsSupported(CARD32 id)
     return FALSE;
 }
 
+#ifdef HAVE_KMS
+static Bool NVKernelModesettingEnabled(struct pci_device *device)
+{
+    char *busIdString;
+    int ret;
+
+    if (!xf86LoaderCheckSymbol("DRICreatePCIBusID"))
+        return FALSE;
+
+    busIdString = DRICreatePCIBusID(device);
+
+    ret = drmCheckModesettingSupported(busIdString);
+    xfree(busIdString);
+
+    return (ret == 0);
+}
+#else
+static inline Bool NVKernelModesettingEnabled(struct pci_device *device) { return FALSE; }
+#endif //HAVE_KMS
+
 /* Mandatory */
 #if XSERVER_LIBPCIACCESS
 static Bool
@@ -864,6 +889,14 @@ NVPciProbe(DriverPtr drv, int entity, struct pci_device *dev, intptr_t data)
                NV_NAME ": Found NVIDIA %s at %2.2x@%2.2x:%2.2x:%1.1x\n",
                name, dev->bus, dev->domain, dev->dev, dev->func);
 
+    /* Trying to bring up a NV mode while kernel modesetting is enabled
+       results in badness */
+    if (NVKernelModesettingEnabled(dev)) {
+        xf86Msg(X_ERROR,
+                NV_NAME ": Kernel modesetting driver in use, refusing to load\n");
+        return FALSE;
+    }
+
     if(NVIsG80(id))
         return G80GetScrnInfoRec(NULL, entity);
     else if(dev->vendor_id == PCI_VENDOR_NVIDIA_SGS)
-- 
1.7.0.4

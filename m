From: okias <d.okias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Remove deprecated file
Date: Sun, 2 Aug 2009 19:30:41 +0200
Message-ID: <c2673ca60908021030j7c5c8ef9x842876217f0e61d3@mail.gmail.com>
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

This file is 13 years old and NV01/03 isn't even supported by Nouveau.
This patch remove README.NV1.

--- a/README.NV1	2009-08-02 18:19:25.000000000 +0200
+++ b/README.NV1	1970-01-01 01:00:00.000000000 +0100
@@ -1,42 +0,0 @@
-           Information for NVidia NV1 / SGS-Thomson STG2000 Users
-
-                                 David McKay
-
-                               20th March 1997
-
-1.  XFree driver for NVidia NV1 / SGS-Thomson STG2000 v1.0
-
-This driver now accelerates bitblits and filled rectangles. It also support a
-hardware cursor.  More graphic acceleration is planned. There is no plan to
-support the audio functionality of the chip.
-
-1.1  Notes
-
-   o THE DRIVER DOES NOT SUPPORT THE VIRTUAL DESKTOP FEATURES OF XFREE86 This
-     is because the NV1 does not have the necessary hardware to support this
-     feature. If you want to change resolutions, you will have to modify your
-     config file. Comment out all but the mode you wish to use.
-
-   o The generic VGA16 server will not work with the NV1.  For this reason
-     XF86Setup cannot be used to configure the server.  Use xf86config
-     instead.  Select `Diamond Edge 3D' as your board, and select only ONE
-     mode for each of 8bpp and 16bpp.  Do not select a virtual desktop.
-     Also, make sure you don't select a RAMDAC or clock chip.
-
-   o The NV1 only supports a 555 RGB Weight in 16 bpp, the hardware does not
-     do 565. You must put a Weight 555 in the Display section.
-
-   o 24/32 bpp mode is not yet supported.
-
-1.2  Known Bugs
-
-   o The driver should force Weight 555 in 16 bpp mode
-
-   o The hardware cursor doesn't work if an doublescan mode is selected.
-
-   o Screen blanking doesn't work, nor does DPMS.
-
-     Generated from XFree86:
xc/programs/Xserver/hw/xfree86/doc/sgml/NV1.sgml,v 3.3 1997/03/22
09:35:30 hohndel Exp $
-
-
-$XFree86$

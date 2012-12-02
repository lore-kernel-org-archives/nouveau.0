From: Sebastian Glita <glseba-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Subject: Re: kms etc nouveau X failed
Date: Sun, 2 Dec 2012 08:04:09 -0800 (PST)
Message-ID: <1354464249.70308.YahooMailNeo@web120402.mail.ne1.yahoo.com>
References: <1354028922.6600.YahooMailNeo@web120404.mail.ne1.yahoo.com>
	<50B4DEB9.1050102@bounced.me>
Reply-To: Sebastian Glita <glseba-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <50B4DEB9.1050102-8Y23ZgqdBYRBDLzU/O5InQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Tyler Durden <tylerdu-8Y23ZgqdBYRBDLzU/O5InQ@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi,

I tried "AutoEnableDevices" to "false", but I got the same effect. Today I =
recompiled
the kernel 3.6.10 and removed the 'CONFIG_USB_OTG' option, I don't know if =
it has anything to do with it; and also I got the daily repository updates =
and IT STARTED!!!.

Thanks, until the next nouveau error ;|,
Sebastian


--- kernel-config-x86_64-3.6.9-pf=A0=A0=A0 2012-11-20 23:12:41.702162300 +0=
200
+++ kernel-config-x86_64-3.6.10-pf=A0=A0=A0 2012-12-02 11:54:26.860910055 +=
0200
@@ -1,6 +1,6 @@
=A0#
=A0# Automatically generated file; DO NOT EDIT.
-# Linux/x86 3.6.6-pf Kernel Configuration
+# Linux/x86 3.6.10-pf Kernel Configuration
=A0#
=A0CONFIG_64BIT=3Dy
=A0# CONFIG_X86_32 is not set
@@ -2370,7 +2370,7 @@
=A0#
=A0# CONFIG_USB_DYNAMIC_MINORS is not set
=A0CONFIG_USB_SUSPEND=3Dy
-CONFIG_USB_OTG=3Dy
+# CONFIG_USB_OTG is not set
=A0# CONFIG_USB_OTG_WHITELIST is not set
=A0# CONFIG_USB_OTG_BLACKLIST_HUB is not set
=A0# CONFIG_USB_MON is not set

----- Original Message -----

> From: Tyler Durden <tylerdu-8Y23ZgqdBYRBDLzU/O5InQ@public.gmane.org>
> To: Sebastian Glita <glseba-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
> Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
> Sent: Tuesday, November 27, 2012 5:39 PM
> Subject: Re: [Nouveau] kms etc nouveau X failed
> =

> On 27.11.2012 16:08, Sebastian Glita wrote:
>> =A0 =A0 =A0 Option=A0 =A0 =A0 =A0 "AutoEnableDevices"=A0 =A0 "true"
> =

> I had some problems before when I let X (together with udev) autoconfigur=
e =

> devices. So I always have the above option set to false. And I suggest yo=
u try =

> that first, too. It might help.
> =

> Generally, the problem is that your device (the GPU itself) goes undetect=
ed:
> =

> [ 63179.191] (EE) No devices detected.
> =

> -- Tyler
> =

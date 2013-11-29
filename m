From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: Selecting supported chipsets in the driver?
Date: Fri, 29 Nov 2013 15:13:46 +0100
Message-ID: <5298A11A.4090608@free.fr>
References: <CAMjv+TQLp4dCfa0FHmfUOYZR3H_RMwiev=59Ocr3WN=drky=YQ@mail.gmail.com>	<51F83EA7.8050704@gmail.com>	<CAKb7UvgNmvcuUD4T0+0MdK_Drk3vp9CgLGGtANJC_up04otvvA@mail.gmail.com>	<51F922E7.1050100@free.fr>	<CAKb7UvhyvHXN5dXdfp_By6K3fdr_17S87ptgLP-EHLpw_G=V6g@mail.gmail.com>	<51F9306B.1020602@free.fr>	<CAMjv+TTjz40ry-i7XaVTS488_iFrT0rj-K2LHiDEhxZmW69Law@mail.gmail.com>
	<CAMjv+TSscEmtCzW+oJ9oQ5hOewmZDWQwJ-FRb3cg==bkY=Bm1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAMjv+TSscEmtCzW+oJ9oQ5hOewmZDWQwJ-FRb3cg==bkY=Bm1A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

Le 29/11/2013 14:17, Christ-Jan Wijtmans a =E9crit :
> so uhm, as far as i know in ATI drivers this is possible, why no nouveau?

Well, because we share a lot of code between chipsets and it would be a =

pain not to compile everything.

FYI, on Archlinux:
-rw-r--r-- 1 root root 379K 26 nov.  11:18 =

/lib/modules/3.12.1-3-ARCH/kernel/drivers/gpu/drm/nouveau/nouveau.ko.gz
-rw-r--r-- 1 mupuf mupuf 1,5M 29 nov.  15:06 nouveau.ko
-rwxr-xr-x 1 root root 180K 16 nov.  16:00 =

/usr/lib/xorg/modules/dri/nouveau_vieux_dri.so
-rwxr-xr-x 1 root root 6,5M 16 nov.  16:00 =

/usr/lib/xorg/modules/dri/nouveau_dri.so

-rw-r--r-- 1 root root 583K 26 nov.  11:18 =

/lib/modules/3.12.1-3-ARCH/kernel/drivers/gpu/drm/radeon/radeon.ko.gz
-rw-r--r-- 1 mupuf mupuf 2,2M 29 nov.  15:07 radeon.ko

-rw-r--r-- 1 root root 337K 26 nov.  11:18 =

/lib/modules/3.12.1-3-ARCH/kernel/drivers/gpu/drm/i915/i915.ko.gz
-rw-r--r-- 1 mupuf mupuf 1,2M 29 nov.  15:08 i915.ko

So, the whole of nouveau weights a little more than 7MB. Even by floppy =

standards, it isn't huge! And I'm not talking about nvidia's driver that =

is WAY bigger.

So, If you manage to make a good patch a prove you can save a =

substential amount of space and that isn't a pain to maintain, then =

maybe we'll consider this.

Cheers,
Martin

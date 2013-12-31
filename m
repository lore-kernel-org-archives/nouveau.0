From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Possible 3.13-rc nouveau regression with GT 560 Ti
Date: Tue, 31 Dec 2013 05:36:32 -0500
Message-ID: <CAKb7UvhBunpMC6mzjRg7Zb5gGPPYj99=2jd+Lgnr-qeXFs0w9A@mail.gmail.com>
References: <52C29918.4060102@blueyonder.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <52C29918.4060102-QgLWrMLu8clzjhtm8Ag3mw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: sboyce-QgLWrMLu8clzjhtm8Ag3mw@public.gmane.org
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, opensuse factory list <opensuse-factory-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>, LKML Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Dec 31, 2013 at 5:14 AM, Sid Boyce <sboyce-QgLWrMLu8clzjhtm8Ag3mw@public.gmane.org> wrote:
> System x86_64 with openSUSE 13.1.
> X.Org version: 1.14.99.905
>
> openSUSE 12.2 kernels boot successfully into a graphical screen, login to
> KDE4, etc. all normal.
>
> 3.13-rc kernels boot fully with X running but no graphical screen and it
> freezes in VC with not all the startup messages displayed but I could ssh in
> from another box to check dmesg and logs.
>
> Xorg.0.log which I thought I had saved did not log an error.
>
> dmesg said "nouveau Playlist update failed".
>
> Changed the GeForce GT 560 Ti for a GeForce 8600 GT and 3.13.0-rc6 is up and
> running.
>
> If necessary I can go back to the GT 560 Ti to gather dmesg and Xorg log
> information.

Having a dmesg would be nice. One thing I can think of off-hand is
that 3.13-rc has MSI turned on by default. You can turn it off by
adding "nouveau.config=NvMSI=0" to your kernel cmdline. If that
doesn't help, a bisect restricted to drivers/gpu/drm/nouveau should
show the offending commit fairly quickly.

  -ilia

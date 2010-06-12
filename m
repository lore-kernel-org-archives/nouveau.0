From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Need help getting nouveau drivers working on Fedora 13
Date: Fri, 11 Jun 2010 20:10:52 -0400
Message-ID: <AANLkTim6_KDoKsn6b09aKAmLRfmSfULVmO_4sQcqWQ0C@mail.gmail.com>
References: <4C12BCFB.6070508@zeff.us>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4C12BCFB.6070508-6czteffKXy8@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Joe Zeff <joe-6czteffKXy8@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Jun 11, 2010 at 6:47 PM, Joe Zeff <joe-6czteffKXy8@public.gmane.org> wrote:
> My desktop computer uses a GeForce FX 5200 card and, when I was using Fed=
ora
> 11, the kmod-nvidia drivers (a Fedora-specific repackaging of the binary
> blob) worked Just Fine. =A0Now, even though I've followed all of the
> instructions for them, they don't. =A0In fact, my system won't even compl=
ete
> booting if they're active. =A0(I'm posting from a laptop, while I'm tryin=
g to
> get my desktop up again.) =A0I've removed all of the nvidia packages and
> reinstalled Xorg; no mesa packages installed. =A0When I try to log in und=
er X,
> I can see the desktop, briefly, long enough to see that my screenlets are
> loading in the wrong place, then, it's the infamous White Screen Of Death.
> =A0The desktop doesn't just turn white, it's more like a curtain being dr=
awn
> down over it, that never comes back up. =A0Going to an alternate console =
and
> checking .xsession-errors, the last message that I can understand is from
> compiz, saying that it can't find some 8 bit pixmaps.
>
> I'd greatly appreciate any pointers as to what I need to do, other than
> replace the video card (Not a pleasant option, because I've no reason to
> believe that it's gone bad.) to get my desktop back under control. =A0If
> there's any other info that you need, just ask.

Hi. When you say you reinstalled Xorg without mesa packages, I'm
assuming you mean that you didn't install the nouveau mesa driver? If
so it sounds like you're trying to run compiz with the software
rasterizer. Not sure if/how that works, last I heard it didn't. Either
way, can you try without compiz? If you still have problems please
attach a kernel log (the output of dmesg) and an Xorg log.

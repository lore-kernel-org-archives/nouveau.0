From: "Younes Manton" <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: (EE) AIGLX error: dlopen of
	/usr/lib/dri/nouveau_dri.so failed
Date: Mon, 29 Dec 2008 23:26:42 -0500
Message-ID: <586c2acd0812292026pf4c033eua3e1020bae57ffc3@mail.gmail.com>
References: <20081230025146.GA28418@homero.springfield.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20081230025146.GA28418-ukiYB341y+1jWMeXa1+QZ5bDTtF7IOEM@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Leandro Lucarella <llucax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Dec 29, 2008 at 9:51 PM, Leandro Lucarella <llucax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi. I'm trying nouveau and I'm having some troubles. I filled a bug[1]
> a while ago about a problem I had (and I'm still experimenting), but
> I found another issue that I suspect is normal. I get this in my Xorg.log:
> [...]
> (II) Initializing built-in extension COMPOSITE
> (II) Initializing built-in extension DAMAGE
> (II) Initializing built-in extension XEVIE
> drmOpenDevice: node name is /dev/dri/card0
> drmOpenDevice: open result is 10, (OK)
> drmOpenByBusid: Searching for BusID pci:0000:02:00.0
> drmOpenDevice: node name is /dev/dri/card0
> drmOpenDevice: open result is 10, (OK)
> drmOpenByBusid: drmOpenMinor returns 10
> drmOpenByBusid: drmGetBusid reports pci:0000:02:00.0
> (EE) AIGLX error: dlopen of /usr/lib/dri/nouveau_dri.so failed (/usr/lib/dri/nou veau_dri.so: cannot open shared object file: No such file or directory)
> (EE) AIGLX: reverting to software rendering
> (II) Loading sub module "GLcore"
> (II) LoadModule: "GLcore"
> [...]
>
> Is this expected or I have some installation problems? I'm using
> Debian/Ubuntu packages at http://ppa.launchpad.net/raof/ubuntu (I build
> the kernel module using drm-modules-source and I install
> xserver-xorg-video-nouveau too).
>
> TIA.

Yes that's normal, it just means that the Mesa hardware driver is not
found and AIGLX will use software rendering instead.

>
> [1] http://bugs.freedesktop.org/show_bug.cgi?id=16327
>

You should try a newer xserver (1.5 or later) if possible, that might
help this problem.

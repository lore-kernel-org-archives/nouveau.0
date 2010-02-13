From: "Shinpei KATO" <shinpei-a3aLqY3FAeqkRP3n4FtbsiGn5s73+xxf@public.gmane.org>
Subject: Re: Bugs in nouveau_channel_alloc()
Date: Sun, 14 Feb 2010 06:18:21 +0900
Message-ID: <000601caacf2$141d2d40$3c5787c0$@is.s.u-tokyo.ac.jp>
References: <001e01caac41$a3ea3f50$ebbebdf0$@is.s.u-tokyo.ac.jp>
	<20100213101608.GA2880@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100213101608.GA2880-OI9uyE9O0yo@public.gmane.org>
Content-Language: ja
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: 'Marcin Slusarz' <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Dear Marcin,

Thanks for your response.
You are right.
The latest git has fixed this bug.
In fact, the out-of-tree Nouveau module was conflicting with the one
included in the kernel tree in my machine, since I tried the module
independently before.
It is my appologie for this careless question.

Best,
- Shinpei

> -----Original Message-----
> From: Marcin Slusarz [mailto:marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
> Sent: Saturday, February 13, 2010 7:16 PM
> To: Shinpei KATO
> Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Subject: Re: [Nouveau] Bugs in nouveau_channel_alloc()
> 
> On Sat, Feb 13, 2010 at 09:15:20AM +0900, Shinpei KATO wrote:
> > Hi all,
> >
> > I have just started using Nouveau, with Fedora 12.
> > I downloaded the source from the Nouveau kernel repository, and built
> it by
> > following the instructions in the Nouveau Wiki page.
> > The new Linux kernel with Nouveau seems to work without any problems,
> but I
> > found some error messages in the kernel log.
> > The attached file contains the kernel messages related to the Nouveau
> DRM,
> > which I copied and pasted from the original kernel log.
> >
> > To my understanding, two errors occured when the nouveau_channel_alloc()
> > function is called.
> > In particular, the first one occured when modprobe is done, and the
second
> > one did when Xorg is launched.
> > I am not sure if these errors are actually "BUGs" or not.
> > Wish someone gives me some advice for them.
> 
> This bug is already fixed in latest git. Just upgrade the kernel.
> 
> Marcin

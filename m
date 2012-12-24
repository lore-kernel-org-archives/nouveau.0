From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: DRM NOUVEAU: cannot boot with kernel >=3.7
Date: Mon, 24 Dec 2012 22:03:51 +0100
Message-ID: <20121224210351.GB3127@joi.lan>
References: <29887.1356380801@dschgrazlin2.units.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <29887.1356380801-kxnQuhtYantLT78x9S+moD0NalFo2+mf@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: balducci-KqplAB4qOuE@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Dec 24, 2012 at 09:26:17PM +0100, balducci-KqplAB4qOuE@public.gmane.org wrote:
> hello everybody,
> 
> apologies if I am missing any blatant point; my knowledge about
> KMS/DRM etc. is very poor, so I am asking for help here (hoping to be
> at the right place)
> 
> Starting with kernel-3.7 I am not able to boot any more in KMS: as
> soon as the screen resolution changes in the very early stage of the
> boot, the machine freezes and the only option I'm left with is to
> press a physical reset button.
> 
> I am on an athlon64 dual core machine and using DRM/NOUVEAU with a
> NVIDIA GeForce 6200 LE GPU
> 
> Here are some facts:
> 
> => while kernel-3.7.x gives the problems mentioned above,
>    kernel-3.6.{8-10} boots just fine (and X11 works nicely)
> => if it can be of any use: if I reboot from a running 3.6.x kernel
>    into a 3.7.x, the obtained freezed console screen shows the (somewhat
>    misplaced) lines which were printed during the shutdown phase of
>    the reboot process (I can send a screen photo, if needed)
> => kernel-3.7.x boots just fine on another box (another athlon64 dual core with
>    a GeForce 6150SE nForce 430 (rev a2) GPU); kernel is 32bit there,
>    if it matters
> 
> I am attaching lspci output and my kernel config below.
> 
> I will warmly appreciate any hint and will be more than happy to send
> in any other information which might be useful

Thanks for reporting.

Please follow instructions from http://nouveau.freedesktop.org/wiki/Bugs and
open new bug report. You may need to compile nouveau as module to catch full
kernel log.

Marcin

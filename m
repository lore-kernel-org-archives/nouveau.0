From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: GeForce 8400 GS
Date: Thu, 3 Oct 2013 17:57:24 -0400
Message-ID: <CAKb7UvhWkTnsJLxgwVPxVSEpcX+38fxjBqKP26t8NqvEHmCOmg@mail.gmail.com>
References: <1380825934.841834684@f291.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1380825934.841834684-MnY5EB7xCO9sdVUOrk1QfQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Fernando Negro <fernando.negro-JGs/UdohzUI@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Oct 3, 2013 at 2:45 PM, Fernando Negro <fernando.negro-JGs/UdohzUI@public.gmane.org> wrote:
> Hi everyone.
>
> I read on a 2011 article -
> http://www.phoronix.com/scan.php?page=article&item=nouveau_comp_2011&num=19
> - that my particular card, GeForce 8400 GS, overheats with nouveau. (So, I
> never tried using if for long, before, as soon as possible, installing the
> proprietary drivers...) But, because it's a 2-year-old article, I was
> wondering if that problem could have been, in the meantime, solved?... (Can
> anyone tell me if that is so, or not - or indicate me a place where I can
> know that?)

There are actually several versions of the 8400 GS, the exact chipset
would be a better indicator (if you're trying to compare to Phoronix
results). It seems like the complaint in the article was that the
passively cooled GPU was running at 80 degC. While that's quite warm,
I'm pretty sure that's not nearly enough to be damaging. I had run my
9500GT (which started out with a fan that I later removed) at 90-95
degC with no apparent ill effect.

If you do have a fan, there is some semblance of control in the latest
kernels. Take a look at
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/thermal/nouveau_thermal
for more details. There is also experimental reclocking support for
the nv50 family chipsets (as well as nv40), which tends to be very
much hit or miss. Works great when it works, but hangs the card when
it doesn't. Take a look at
http://nouveau.freedesktop.org/wiki/KernelModuleParameters/,
specifically perflvl_wr. Note that this only provides manual control,
not dynamic like the latest radeon and nvidia proprietary drivers.

Hope this helps,

  -ilia

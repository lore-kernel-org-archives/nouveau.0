From: Dirk Thierbach <dthierbach-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: TV-Out on a GeForce 2MX supported?
Date: Wed, 5 Mar 2014 20:34:10 +0100
Message-ID: <20140305193410.GA13365@feanor>
References: <20140303224123.GA5720@reliance.ac-net>
	<CAKb7Uvj2FKoRt2O6YqiamgL=svZqmxjxoqdxySN3Lidu+bWxsQ@mail.gmail.com>
	<20140305110645.GA1972@feanor>
	<CAKb7Uvi97Yn8MOfhMiXLs+=VAd0LWEnmnF7iHyR58eKA_Pk_jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKb7Uvi97Yn8MOfhMiXLs+=VAd0LWEnmnF7iHyR58eKA_Pk_jg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Mar 05, 2014 at 12:46:04PM -0500, Ilia Mirkin wrote:
> I actually checked this out last night, grabbed the BT869 datasheet.
> Basically you'd have to implement something similar to the ch7006
> driver (see drivers/gpu/drm/i2c), which provides an API for setting
> modes (the BT869 appears to have 8 of them, of which I'm guessing only
> 4 are actually usable, probably the RGB ones). 

The 8 "modes" are just predefined sets of values, baked into the chip
for easier setup. There's basically an unlimited number of "modes",
with any resolution or overscan, subject to timing constraints.
Think modelines, but with more values and different registers.

BTW, the RGB modes only make sense if you have a special kind of 
connector. The PAL and NTSC modes are the ones that are normally used
on those cards. 

> The stuff about overscan/etc are exposed as KMS properties (which in
> turn appear in xrandr) and not specific to the BT869. 

The problem is that there's no good way to just say "I want this
overscan" and then get a valid set of register values, because of
the timing constraints. Nvtv includes a sort of "calculator" that
tries to calculate a collection of sets of sensible values as close
to a desired overscan as possible, but you still have to check (and
tweak, if necessary) every of those sets to see if it actually works.

> The i2c driver is supposed to expose a ->mode_set() function, which
> takes a drm_display_mode.

We had this discussion on the xorg mailing list back then, I think
even before there was kernel mode setting. In short, xrandr properties
and X-style modelines are just not enough to be able to program the
BT/CX chip sensibly. You need a different infrastructure.

As I said, as a workaround one can use a number of predefined modes
baked into the kernel. That's better than no support at all, but not as
good as being able to program the BT/CX chip freely.

And then there's the Philips TV encoder chip, which has a similar freedom
in programming.

Of course, given that analog TVs are dying out, the question is how
much effort one should put into this whole thing in the first place.

- Dirk

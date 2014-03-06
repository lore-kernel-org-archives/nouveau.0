From: Dirk Thierbach <dthierbach-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: TV-Out on a GeForce 2MX supported?
Date: Thu, 6 Mar 2014 10:19:14 +0100
Message-ID: <20140306091913.GA29147@feanor>
References: <20140303224123.GA5720@reliance.ac-net>
	<CAKb7Uvj2FKoRt2O6YqiamgL=svZqmxjxoqdxySN3Lidu+bWxsQ@mail.gmail.com>
	<20140305110645.GA1972@feanor>
	<CAKb7Uvi97Yn8MOfhMiXLs+=VAd0LWEnmnF7iHyR58eKA_Pk_jg@mail.gmail.com>
	<20140305193410.GA13365@feanor> <871tyg6yk3.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Resent-Message-ID: <20140306092603.GB29147@feanor>
Resent-To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <871tyg6yk3.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Mar 06, 2014 at 12:00:28AM +0100, Francisco Jerez wrote:
> The current model doesn't require the encoder driver to have a
> predefined list of modes -- it's just highly recommended if you don't
> want to force the user to input mode lines manually.  

If there was a way to have the user input the equivalent of mode
lines for the BT chip, full support would be easy (and I would have
probably done it at some stage in the past). But the X infrastructure
just concerns itself with CRTC modelines (and later on added
xrandr properties), which are not enough.

> You just need some means to compute the optimal timings
> algorithmically given the connector properties and a rough
> description of the mode.

Which is the difficult part for the BT chip. While some of the timing
constraints are known, others are not. Also, there's no "optimal" solution,
what the calculation routine in nvtv does is to compute several
"close" solutions and let the user pick one. And sometimes they are
not even particularly close. Also, as I said, the solutions with very
little overscan sometimes don't give a stable image or no image at
all.

So calculating optimal timings in the kernel without user interaction
is not feasible. Unless you somehow discover the missing timing
constraints. Even the size of the internal FIFO is not known.

> Sure, using a fixed list of modes from which you pick the "closest"
> to the user's settings might be the easiest way to achieve that on
> some chips [ch7006 does precisely that IIRC],

The Chrontel chips only have a very limited number of modes in the
first place. But even then it makes sense to have more flexibiliy. For
example, you can take one of the 800x600 modes with almost no overscan
border, chop off the bottom and right and recenter shifting the sync
procesessing, and that gives you a nice 768x576 mode for watching
DVDs.

> and that might be a slight underuse of the
> flexibility of some hardware, but the API doesn't force you to do that.

Give me a way to pass a block of two dozen or so values to the chip in
addition to a CRTC modeline that is not checked for the usual constraints,
and give the user a way to specify these values in the config file or
let them choose one from a predefined list, and full support is easy.

- Dirk

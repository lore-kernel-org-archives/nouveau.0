From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: GeForce 8400 GS (follow-up)
Date: Tue, 8 Oct 2013 00:08:48 -0400
Message-ID: <CAKb7Uvi3mOdvfm7mQZK3bDC+rfd+gJOqPsRFR6Pth_AwEyhRnw@mail.gmail.com>
References: <CANc-zbwkOsc==fya5nk+GnRHu12uzOcu5Qts482AsakWoc_UMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CANc-zbwkOsc==fya5nk+GnRHu12uzOcu5Qts482AsakWoc_UMQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Fernando Negro <f3rn4nd0.n3gr0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sun, Oct 6, 2013 at 6:31 AM, Fernando Negro <f3rn4nd0.n3gr0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The thing is, that, although I thought I had already run nouveau in it, I
> was, after all, only running a generic vesa driver, every time before I
> installed the proprietary drivers... And, I suppose that the wrong idea I
> had, of having been able to run nouveau already, was either: due to error
> messages that appeared, before I added the "nomodeset" parameter in the
> kernel line (that I didn't know that made it impossible for nouveau to
> load); or due to having used a previous NVIDIA card that, maybe, could
> already run nouveau, before it started malfunctioning...
>
> Anyway, I decided to finally seriously try running the nouveau driver in it.
> But, after many failed attempts, I was, unfortunately, not able to... And, I
> suspect the main cause for it to be the particular brand of my card, that
> doesn't seem to be very good. (Since that, I know of other people that have
> the same NVIDIA chip, and that are able to run nouveau on their cards...)
>
> The report of my experience, for anyone interested in it, can be read here:
> http://trisquel.info/en/forum/nouveau-mi-eq-overflowing
>
>
> Thank you very much, all of you, for your help.

The logs in the post show that you're using a 3.2.0 kernel, which is
several years old. Might I recommend trying something a bit more
recent? Like 3.11.

  -ilia

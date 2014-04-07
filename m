From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Assistance in tracking a kernel/nouveau error
Date: Sun, 6 Apr 2014 21:43:52 -0400
Message-ID: <CAKb7UvjLr4z50Kvh2FowJ+0_va53r1n+wa5hOC=_LOU_5P7QOg@mail.gmail.com>
References: <5339EB75.1080109@gmail.com>
	<5341E03C.7020109@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5341E03C.7020109-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: ~Stack~ <i.am.stack-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sun, Apr 6, 2014 at 7:16 PM, ~Stack~ <i.am.stack-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Greetings,
>
> I am resending this as it doesn't appear in the archives and no one
> responded...maybe it got routed to /dev/null or something :-)
>
> I have asked this question the Scientific Linux mailing list (a few
> months ago) and got the suggestion I talk to the kernel guys. I pinged a
> kernel guy I know, and his suggestion was to ask the Nouveau list. So
> here I am. :-)
>
> I have had my work laptop for well over a year now running SL6 and
> everything has been fantastic. Never once have I had a kernel
> panic/problem. That is until the kernel 2.6.32-400+ series. Rolling back
> to the previous kernel 2.6.32-358 works perfectly, which is what I have
> been doing. The problem is that I am now getting the same issue on other
> laptops with the latest kernel 2.6.32-431.11.2.el6.x86_64. My laptop is
> Dell Precision M4600. 80% of the time it is plugged into my Dell PRO2X
> laptop dock which has my dual Display Port Dell U2410 monitors (betcha
> can't tell what vendor my employer frequently buys from...;-).
>
> My working kernel is: 2.6.32-358.23.2.el6.x86_64 (and anything before).
>
> The problem kernel is: 2.6.32-431.1.2.el6.x86_64 and every revision
> up-to the latest 2.6.32-431.11.2.el6.x86_64.

These are redhat frankenkernels, perhaps you should be talking to
redhat? You might try a kernel bisect, if they supply a set of patches
between rpm's. Also, what hardware do these laptops have? (lspci
otuput would be nice). Can you test with a fresh kernel (e.g. some
distro's livecd) rather than one based on a 5-year old release?

>
> I get horrible color distortions on the secondary display. This happens
> every time. At BIOS both monitors display perfect color in a duplicate
> view showing the same image on both screens. Grub only shows primary
> screen (normal for this setup). When Grub loads the nouveau display
> driver the second screen turns on and the display looks like a rainbow
> puked glitter. Not even exaggerating. Crazy jumbled colors in warped
> patterns that move across the screen. The primary monitor is just fine.
> At first I thought it was the monitor, but swapping the monitors shows
> they are fine. Other testing showed that the hardware is just fine too
> and the final proof was evident by being able to boot into the previous
> kernel and not having an issue.
>
> I never have run the NVidia drivers on this laptop. It has always been
> Nouveau. (I run NVidia drivers on other systems, but this laptop has
> previously always been rock solid with SL+Nouveau so I never bothered).
>
> Today I found that the new batch of Dell Latitudes with a fresh install
> do nearly the same thing. The image is viewable, but is horribly color
> distorted. The really weird thing with the Latitudes is that I can
> disable the screen (via software) and about 4 out of 5 times, when I
> re-enable it I get a proper screen again. It always goes bad on a fresh
> boot and this trick does not appear to work with my Precision. I dug out
> the 2.6.32-358 kernel RPM, installed it on one and bingo...no issues.
> Screen is great and works just fine.
>
> So now I am more than ever convinced there is an issue with nouveau in
> any of the kernels post 2.6.32-358.23.2.
>
> I have searched around and asked around but haven't found a solution. I
> can put the kernel into all kinds of debugging and capture GB's of data,
> but I would prefer to capture only what is useful. Any recommendations
> on what output I should capture? Any suggestions on narrowing the
> problem down to something other then "Its the kernel"?
>
> Thanks! I appreciate the help!
>
> ~Stack~
>
>
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

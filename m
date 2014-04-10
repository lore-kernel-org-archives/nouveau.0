From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Assistance in tracking a kernel/nouveau error
Date: Thu, 10 Apr 2014 18:14:03 -0400
Message-ID: <CAKb7UvgG=u9TCCwMC+UJMMmsa3G6qL0KrCzE5n2rxASN14XKfA@mail.gmail.com>
References: <5339EB75.1080109@gmail.com> <5341E03C.7020109@gmail.com>
 <CAKb7UvjLr4z50Kvh2FowJ+0_va53r1n+wa5hOC=_LOU_5P7QOg@mail.gmail.com>
 <5345CAE9.1080908@gmail.com> <53471642.8010802@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53471642.8010802-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Thu, Apr 10, 2014 at 6:08 PM, ~Stack~ <i.am.stack-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 04/06/2014 08:43 PM, Ilia Mirkin wrote:
>>> On Sun, Apr 6, 2014 at 7:16 PM, ~Stack~ <i.am.stack-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> [snip]
>>> Can you test with a fresh kernel (e.g. some
>>> distro's livecd) rather than one based on a 5-year old release?
>
> Greetings,
>
> I tried Ubuntu 13.04 and 13.10 and had no problems with their live cd
> and the monitors. I then tried Fedora 19 (the only Fedora live CD I had)
> and it has the same problems as the RHEL kernel. The monitor output on
> the second display is jumbled colors. I will pull a new live CD down
> tonight and try again.
>
> If it happens on the new Fedora, maybe it might be worth it to try and
> contact them.
>
> Any other thoughts/suggestions?

You might mention what hardware you have (lspci output for the nvidia
card... just need the chip name), and what kernels the various distros
are using. (I think that Ubuntu/Fedora tend not to make frankenkernels
like RHEL does, so the version has some sort of correlation to actual
upstream versions.) That might help identify potential issues that
were fixed.

  -ilia

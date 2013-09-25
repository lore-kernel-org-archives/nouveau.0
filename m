From: Andy Ritger <aritger-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: offer to help, DCB
Date: Tue, 24 Sep 2013 17:34:22 -0700
Message-ID: <20130925003422.GE28691@parker.nvidia.com>
References: <20130924044457.GA25785@parker.nvidia.com>
	<52413B42.9050101@canonical.com>
	<20130924181938.GD27823@parker.nvidia.com>
	<CAPM=9tykSx_p-SgK9+JpUADD8E_M6ciS5kXd68UaE-A9-sgiYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPM=9tykSx_p-SgK9+JpUADD8E_M6ciS5kXd68UaE-A9-sgiYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Sep 24, 2013 at 12:43:46PM -0700, Dave Airlie wrote:
...
> 
> Hey Andy,
> 
> this is great news,
> 
> I suppose the question I have is there any known upfront limits on
> what you can release or is it going to be a per-request type thing?

Hi Dave.

I think we're going to have to deal with things on a case-by-case basis.
I wouldn't take anything off the table, yet.  You all can probably
imagine what areas may have IP/security/whatever entanglements, which
will be more painful for NVIDIA to sort through.  But, for now, just
enumerate what information would be most useful.  The more specific and
targeted the request, the more focused (and hopefully efficient) the
internal vetting process can be.

> My main request if you give Ben whatever he asks for :-P, but I'm
> interested if you guys would be also able to say review things like
> the microcode situation and say explaining what might be missing from
> the nouveau microcode for context switching etc,

For microcode: from NVIDIA's perspective, I think we'd like to move to
a model where NVIDIA releases microcode firmware (as binary-only) with a
defined ABI, versioning, and reasonable licensing to allow redistribution.
We have some release engineering process improvements to make there, since
today the firmware is allowed to evolve along side the NVIDIA proprietary
driver code, and the two are released in lock-step.  But longer-term,
I think we'd like to move things to the firmware that either we're not
comfortable documenting, or things that are Real Hard to get right,
like P-state switching.

Does Nouveau reimplement Falcon microcode due to particular deficiencies
in NVIDIA's microcode, or because you couldn't get permission in the past
to redistribute the firmware extracted from NVIDIA's proprietary driver?
If the latter, I think we can get to the point of solving that with more
amenable licensing.  If the former, I'd like to report the deficiencies
from your point of view back to NVIDIA's firmware team, so that we can
improve the firmware for Nouveau use.

While I know open firmware would be preferred over binary-only firmware
images, hopefully we can find a reasonable compromise there.

> along with VM things like hw with pagefaults etc.

I don't have a great sense for how much internal concern there will be
around pagetable-related documentation.  My guess is that it might be
a little harder than DCB and other BIOS-related docs, but much easier
than clock programming.

Thanks,
- Andy

> Dave.

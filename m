From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: 755M SLI support
Date: Thu, 4 Sep 2014 00:16:56 -0400
Message-ID: <CAKb7UvhrcAGobyXDfV=6cTxz19otB+jo2EgJOCu3AWw_KA77XA@mail.gmail.com>
References: <CANW2TUgXyx7-DSKrqpdoC_s8fZO5XaEBTc-_J4fqr_zt-NUmPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CANW2TUgXyx7-DSKrqpdoC_s8fZO5XaEBTc-_J4fqr_zt-NUmPg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: thirstygnome <thirstygnome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Sep 2, 2014 at 2:27 PM, thirstygnome <thirstygnome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I have a Lenovo y510p laptop that has two 755's in sli. It seems at this
> time Nvidia does not have support for SLI on Linux. Do you support this with
> the 755m card? If so please provide me with a link for instructions.
> Otherwise if this is not supported officially through you guys, is there any
> goal to do so in the future?

Not entirely sure what your question is. If it's exclusively about
SLI, nouveau presently has no SLI support, nor has there been too much
thought put into how we might support that. No other mesa hardware
driver supports SLI configurations either. Getting reliable reclocking
on nouveau seems like a much bigger potential performance gain than
trying to do SLI. (Although the two are fairly unrelated to one
another, so it's not like one is a prereq of the other.)

That said, the GPUs *should* be supported individually, so if you're
having trouble with that, you should provide more info.

  -ilia

From: Daniel J Blueman <daniel-JCXMqzvhRcvYtjvyW6yDsg@public.gmane.org>
Subject: Re: Linux 3.7 Nouveau msi module parameter
Date: Mon, 12 Nov 2012 12:00:48 +0800
Message-ID: <CAMVG2su2pi5ehmEnBNAXfhFEMafOsRvpyGYz3jR_kJZg8g-fUg@mail.gmail.com>
References: <CALjTZvYmtn6Eirhj=dnK4J3q4-DZUBk-2B8ZfnqmQsnyUKg-sQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CALjTZvYmtn6Eirhj=dnK4J3q4-DZUBk-2B8ZfnqmQsnyUKg-sQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Rui Salvaterra <rsalvaterra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 10 November 2012 19:31, Rui Salvaterra <rsalvaterra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I noticed the nouveau module dropped support for the msi parameter on Linux
> 3.7. I've been enabling message signaled interrupts on my ION/MCP79 for a
> while with no adverse effects. Is this intended behaviour our just fallout
> from the rewrite? (I'm not subscribed to this mailing list.)

I was going to ask exactly the same question. For some platforms
IOAPICs (thus legacy interrupts) aren't possible eg with PCIe hotplug
or such, so MSI interrupts are required. The PCIe spec mandates that
they are available for perhaps these purposes, just there is no
mechanism in linux to test and fall back to legacy interrupts if there
are platform issues.

Thanks,
  Daniel
--
Daniel J Blueman

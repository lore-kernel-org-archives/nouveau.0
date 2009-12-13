From: Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: conflicting memory types
Date: Sun, 13 Dec 2009 21:38:37 +0100
Message-ID: <91752840912131238u68498712r82fa762cb8a801f2@mail.gmail.com>
References: <91752840912111012t4bc1d37fo76b5c96040c2cb05@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <91752840912111012t4bc1d37fo76b5c96040c2cb05-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Dec 11, 2009 at 7:12 PM, Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I just noticed these messages in my logs :
> modprobe:1998 conflicting memory types e8000000-e8010000
> uncached-minus<->write-combining
> reserve_memtype failed 0xe8000000-0xe8010000, track uncached-minus,
> req uncached-minus
> ioremap reserve_memtype failed -16
> Xorg:5078 conflicting memory types e8000000-e8010000
> uncached-minus<->write-combining
> reserve_memtype failed 0xe8000000-0xe8010000, track uncached-minus,
> req uncached-minus
>
> I have this on two different box, one with nv25 and one with nv35.
>
> I followed several links on google, and had a look at
> arch/x86/mm/pat.c but I still don't understand well what it means,
> whose fault it is, and what could the consequences be.
> About the possible consequences, that code comment sounds a bit scary,
> even though everything seems to be working.
>
> =A0* The global memtype list keeps track of memory type for specific
> =A0* physical memory areas. Conflicting memory types in different
> =A0* mappings can cause CPU cache corruption. To avoid this we keep track.
>

Just for the record, curro fixed the modprobe one with this patch :
http://annarchy.freedesktop.org/~currojerez/vga_font_memory_types.patch

And about the xorg one :
14:26 < curro_> shining: the x server error is nouveau's fault, most
of the stuff in nv_setup.c deserves killing

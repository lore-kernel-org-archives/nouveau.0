From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau on Linux/sparc64 -- almost!
Date: Wed, 23 Nov 2011 13:29:23 -0500
Message-ID: <CAMVNhxTfyouDTMrT+ybhqC3GQ6oWjNDGCaqeV84+O2QV00HSPA@mail.gmail.com>
References: <4ECC47F8.6020802@gmail.com>
	<CAMVNhxRcM4B0eBLQo+k0UmGxaS1y7jt=V042T65a2nQRkope8Q@mail.gmail.com>
	<CAEk2St=_thpkwT4vjozJutwZ_1=sztzWRqonum9NsX2YW_GKGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAEk2St=_thpkwT4vjozJutwZ_1=sztzWRqonum9NsX2YW_GKGA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Nov 23, 2011 at 11:23 AM, Patrick Baggett
<baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> Are unaligned accesses actually errors on Sparc or just trapped and
>> emulated and therefore slow?
>
> I'm not 100% sure. Architecturally, they are errors on SPARC. Userspace
> applications that do unaligned accesses are sent SIGBUS and usually killed.
> For a driver, I would imagine that the kernel would catch this trap and
> emulate or ignore it rather than go down in a blaze of glory. It should
> generally be treated as an error, and every time I've seen the C code that
> does it, it is usually straight forward to fix it.
>

If you want to fix it the kernel log I guess tells you roughly where to look:

[   37.891494] Kernel unaligned access at TPC[102148ac]
nouveau_bios_init+0x89c/0x29c0 [nouveau]
[   37.891667] Kernel unaligned access at TPC[102148f0]
nouveau_bios_init+0x8e0/0x29c0 [nouveau]
[   37.891833] Kernel unaligned access at TPC[1020a434]
parse_script_table_pointers+0x4/0xec [nouveau]
[   37.891999] Kernel unaligned access at TPC[1020a458]
parse_script_table_pointers+0x28/0xec [nouveau]
[   37.892187] Kernel unaligned access at TPC[1020a478]
parse_script_table_pointers+0x48/0xec [nouveau]

You'll have to take inlining into consideration though, since
nouveau_bios_init for example doesn't actually read the BIOS but has
calls to other functions that do that have been inlined. From briefly
looking at this code the problem appears to be with reading 16 (and
maybe 32) bit values in the BIOS image at various unaligned offsets,
so you can use the get_unaligned() macro where necessary.

>>
>> If you can start X, does that mean fbcon
>> works?
>
> I don't really know a whole lot about fbcon in general. I know that I
> definitely get fbcon on the ATI chip (fb0), but I haven't really researched
> how to get a console going on the NVidia one. I'd be happy to try it and
> report results if you give me a bit of direction.
> Patrick

What I mean is, does KMS kick in? From your log that appears to be the
case, and since you can start X I'm assuming the console renders
correctly and you see what you're typing. You should look at the
kernel log *after* you start X (the snippet you provided is very
limited and is from before you started X).

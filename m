From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau on Linux/sparc64 -- almost!
Date: Tue, 22 Nov 2011 20:38:44 -0500
Message-ID: <CAMVNhxRcM4B0eBLQo+k0UmGxaS1y7jt=V042T65a2nQRkope8Q@mail.gmail.com>
References: <4ECC47F8.6020802@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4ECC47F8.6020802-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Tue, Nov 22, 2011 at 8:10 PM, Patrick Baggett
<baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hey all,
>
> First off, I'd like to say many thanks to the nouveau developers!
>
> I've got a Sun Ultra 10 running Debian 6 (testing branch) with an onboard
> ATI card and a PCI GeForceMX 4000. So far X works fine on the ATI card, but
> I noticed that the DRM driver for the GF4 has a few unaligned accesses in it
> (see log). I can actually start X using that card, but all I get is a black
> screen -- though the cursor works and I can move it around! It seems like it
> is very close to working. Unfortunately, I can't seem kill X in a way that
> preserves the graphical output of either the gfx chip.
>
> Any ideas where to begin hacking at this problem? Any suggestions or known
> issues on RISC systems? I have an x86 box running Debian 6 with a Geforce4
> MX (AGP) as well, so hopefully I can test fixes that will work on both x86
> and sparc64.

Are unaligned accesses actually errors on Sparc or just trapped and
emulated and therefore slow? If you can start X, does that mean fbcon
works?

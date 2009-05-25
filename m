From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: pre-nv50 KMS
Date: Mon, 25 May 2009 10:14:01 +1000
Message-ID: <1243210441.2864.5.camel@localhost.localdomain>
References: <beb59a440905230149m2edc3f6ak3c61a45820a66c5f@mail.gmail.com>
	<beb59a440905230900x302478aoc3e9377c45d32b78@mail.gmail.com>
	<beb59a440905240227u181f817ck33274c4f2a755be3@mail.gmail.com>
	<6d4bc9fc0905240803m54402ce1r9754a6bafaf36c48@mail.gmail.com>
	<beb59a440905241701p4d25cf00jb059efdf187c41a7@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <beb59a440905241701p4d25cf00jb059efdf187c41a7-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Luo Jinghua <sunmoon1997-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, 2009-05-25 at 08:01 +0800, Luo Jinghua wrote:
> On Sun, May 24, 2009 at 11:03 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > It is possible that the DDX is now masking the problem very well, if
> > only your C51 has this cursor issue then i would really suspect this
> > kind of bug.
> >
> 
> The issue is fixed now. Ben Skeggs lastest commit[1] fixed the issue
> in DDX driver by disabling bios parser and don't run the bios byte
> code. I thought I have areadly have the same commit it in my local
> tree. Actually, I did have the fix but revert it later. So, my drm
> tree should work well on nv40 now. For pre-nv40, I don't have any of
> them. I can't test.
It'll likely work well everywhere except nv4 if my own pre-nv5x kms code
is any indication.  I've got fixes to TTM for nv4 in my kernel tree I'll
post sometime this week.

Ben.
> 
> [1] http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=2688c97169d8ea579ba09b9db049e31704f96626
> 
> 

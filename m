From: Luo Jinghua <sunmoon1997-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: pre-nv50 KMS
Date: Mon, 25 May 2009 08:01:05 +0800
Message-ID: <beb59a440905241701p4d25cf00jb059efdf187c41a7@mail.gmail.com>
References: <beb59a440905230149m2edc3f6ak3c61a45820a66c5f@mail.gmail.com>
	<beb59a440905230900x302478aoc3e9377c45d32b78@mail.gmail.com>
	<beb59a440905240227u181f817ck33274c4f2a755be3@mail.gmail.com>
	<6d4bc9fc0905240803m54402ce1r9754a6bafaf36c48@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc0905240803m54402ce1r9754a6bafaf36c48-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, May 24, 2009 at 11:03 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> It is possible that the DDX is now masking the problem very well, if
> only your C51 has this cursor issue then i would really suspect this
> kind of bug.
>

The issue is fixed now. Ben Skeggs lastest commit[1] fixed the issue
in DDX driver by disabling bios parser and don't run the bios byte
code. I thought I have areadly have the same commit it in my local
tree. Actually, I did have the fix but revert it later. So, my drm
tree should work well on nv40 now. For pre-nv40, I don't have any of
them. I can't test.

[1] http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=2688c97169d8ea579ba09b9db049e31704f96626


-- 
Luo Jinghua

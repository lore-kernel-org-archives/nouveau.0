From: Stephane Marchesin <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Subject: Re: DRM changes
Date: Tue, 10 Mar 2009 09:03:32 +0100
Message-ID: <6a89f9d50903100103y5d88e3a4p2608272e89179a00@mail.gmail.com>
References: <6a89f9d50903091449w47c8a79ak37124972b91a6fde@mail.gmail.com>
	<6d4bc9fc0903091523n4eff7715oe5249ebb799e298@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc0903091523n4eff7715oe5249ebb799e298-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Mar 9, 2009 at 23:23, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Questions:
>
> A tree based on what? (linus, drm-next, etc)
>

I would follow drm-next, but I don't think it is very relevant at this
point, since anyway drm-next periodically merges to linus. If there
are reasons to choose one over the other, I'm interested in hearing
them.

> What happens to shared-core?

It will probably meet its creator.

>
> Opinions (assuming this happens):
>
> I'd do a branch for each kernel version (or less if needed), and let
> people who care cherry-pick fixes.
>

Yeah that's what I initially thought, but Pekka said you could also
get an out-of-tree build from a full kernel tree. So that's the two
paths to explore.

Stephane

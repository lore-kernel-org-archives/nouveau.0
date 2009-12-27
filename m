From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [MESA PATCH] Fix nv40_miptree_layout pitch
Date: Sat, 26 Dec 2009 20:25:06 -0500
Message-ID: <586c2acd0912261725sd8f48c9n5b0191319b505382@mail.gmail.com>
References: <ff13bc9a0912251659v27b69ea5he53c912cf86939b7@mail.gmail.com>
	<586c2acd0912251833x1665b258ica2a55ccfff629f6@mail.gmail.com>
	<ff13bc9a0912251937i3c32e044kc84f0c70ff1e9547@mail.gmail.com>
	<586c2acd0912252032t69dc63cej51472ecacc17d05f@mail.gmail.com>
	<ff13bc9a0912252222t7ed30b00q3b5081a8ee6586c4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <ff13bc9a0912252222t7ed30b00q3b5081a8ee6586c4-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, Dec 26, 2009 at 1:22 AM, Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org> wrote:
> I just coded a patch that does this and seems to work fine. It must be
> fixed since it breaks OpenGL (or the state tracker can be changed, but
> it seems better to do it in the driver).
>
> The patch also fixes NV20 and NV30 in the same way. They compile but
> are untested.
>
> I would guess that using the 3D engine is faster for the larger
> levels, but the 2D engine is faster for the smaller ones (and lacks
> this issue).

Hi, this patch and the other swizzle related one seem to have been
mangled, they're wrapped with hard line breaks so I can't apply them.
Can you resend? The cmp/scs one applied fine.

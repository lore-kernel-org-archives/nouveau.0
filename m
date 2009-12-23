From: Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: always do buffer object moves on
	bo->channel
Date: Wed, 23 Dec 2009 21:43:47 +0100
Message-ID: <91752840912231243o76ffcbbfi70944499028cf077@mail.gmail.com>
References: <1261402742-7992-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1261402742-7992-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Dec 21, 2009 at 2:39 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> - Use the "direct" objects that previously only the kernel fifo had.
> - This avoids corruption on some buffer moves.
> - Prevent dma access to ramin, we never use dma there anyway and it's an
> exploit waiting to happen.
>
> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

I wonder if there are many people following the ML and not irc, but
just in case :
This patch fixes my "font corruption problems" (in particular the font
color is sometimes messed up) on suspend/resume.

However there are other problems with this patch so it probably won't
be applied :

17:40 < shining> stillunknown: whats the status of "always do bo moves
on bo->channel" ?
17:40 < stillunknown> shining: i talked with darktama about, it's a
bit of a security risk
17:41 < stillunknown> since users get access to gpu objects and the
likes, and that can be exploited
17:41 < stillunknown> alternative 1 is to set up shadow page tables
that are all linear, but offer the same protection (darktama said he
would try this)
17:41 < stillunknown> alternative 2 is getting cross channel
synchronisation to work

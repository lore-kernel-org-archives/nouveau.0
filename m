From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [NV50] application to confirm texture layout
Date: Thu, 12 Mar 2009 13:42:39 +0100
Message-ID: <6d4bc9fc0903120542t25f3892es5c1b5cbef3439b98@mail.gmail.com>
References: <6d4bc9fc0903111207w5e6486f5we77c274f9b0708bc@mail.gmail.com>
	<6d4bc9fc0903111209h71135386j57dc89c00c70ed8f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc0903111209h71135386j57dc89c00c70ed8f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

For all those (probably NV9X users) who gets streaming pile of errors,
please set WIDTH to a multiple of TILE_WIDTH and HEIGHT to a multiple
of TILE_HEIGHT. And then send the log to me.

@phenriksson (irc name): could you retry with the original program
(with WIDTH and HEIGHT adjusted), but with the smallest tile size:

(TILING_PARAM) TILE_WIDTHxTILE_HEIGHT: (0x00) 32x4

(that goes for everyone sending in bug logs).

Maarten.

On Wed, Mar 11, 2009 at 8:09 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I forgot to say it isn't a fast program, so be prepared to wait at
> least a few minutes for every run.
>
> Maarten.
>

From: Stephane Marchesin <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Subject: Re: RAOF ppa failing to configure xf86-video-nouveau due
	to libdrm_nouveau
Date: Sat, 14 Feb 2009 00:10:12 +0100
Message-ID: <6a89f9d50902131510g4b43d244ve02f7f1071875172@mail.gmail.com>
References: <34576580902131407s4837a0edp9e15374da1c8f1d3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <34576580902131407s4837a0edp9e15374da1c8f1d3-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Mark Carey <mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Feb 13, 2009 at 23:07, Mark Carey <mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> RAOF as noted on IRC earlier today ppa is currently failing to
> configure xf86-video-nouveau;
>
> `checking for LIBDRM_NOUVEAU... configure: error: Package requirements
> (libdrm_nouveau) were not met: No package 'libdrm_nouveau' found`
>
> Effects both 8.04 and 8.10.
>
> First observed because updated drm without matching dri causes loss of
> xv, NoAccel
>

Yeah you need to install libdrm_nouveau which can be found in drm git.
Most likely someone needs to ping the ubuntu people to update for
that, there's nothing we can do...

Stephane

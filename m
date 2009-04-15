From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Strange behavior on kde4
Date: Wed, 15 Apr 2009 16:12:00 -0400
Message-ID: <586c2acd0904151311v1c1ff0c6wf4099c9f2bd8ee10@mail.gmail.com>
References: <8b96e3d20904151027s5fbe1f5do117e7a61114daec3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <8b96e3d20904151027s5fbe1f5do117e7a61114daec3-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Luiz Angelo Daros de Luca <luizluca-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Apr 15, 2009 at 1:27 PM, Luiz Angelo Daros de Luca
<luizluca-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
>
> I filled a bug in kde (4.2.2) for some drawing problems. However, as it
> occurs also with virtualbox, I think this might be related to nouveau.
> I use updated nouveau git + drm git without 3d. Alfter some time, plasma and
> virtualbox, independently, stops to draw some parts randomly. For example,
> when I pass the mouse over icons, they disapear and reapear.
> If I kill plasma or vbox and open it again, it works for some time before
> the same problem reocurs. This happens also with other kde aplications like
> kterminal.
>
> For plasma I got this error:
>
> QPainter::end: Painter not active, aborted
> QPainter::begin: Paint device returned engine == 0, type: 3
> QPainter::setCompositionMode: Painter not active
>
>
>
> I also reported this in:
> https://bugs.kde.org/show_bug.cgi?id=189059
>
> Does anyone has a clue where is the problem?

You tried it with nvidia, nv, vesa, etc and it works I assume?

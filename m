From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Reporting Bugs in the 3D driver
Date: Fri, 18 Dec 2009 16:47:25 -0500
Message-ID: <586c2acd0912181347u55a76abcsd6c629d038fc108e@mail.gmail.com>
References: <200912182215.25285.johannesobermayr@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <200912182215.25285.johannesobermayr-Mmb7MZpHnFY@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Dec 18, 2009 at 4:15 PM, Johannes Obermayr
<johannesobermayr-Mmb7MZpHnFY@public.gmane.org> wrote:
> Hi,
>
> the wiki page tells us that reporting bugs in the 3D driver is not allowed at this time.
>
> The status page tells us that there are some chipset families with basic (or more) 3D functionality.
>
> My question is whether this is the current status or are there some chipsets for which bug reports in the 3D driver are allowed or even wished?
>
> If there are only some special bug reports in the 3D driver wanted and you tell me which they are I will create a bug reporting matrix and edit the frontpage...
>
> Thanks.
> Johannes

Hi,

Personally I don't think it's worth accepting bugs for 3D for any
driver until it passes all of the Mesa and piglit tests (or at least
the ones that excercise the most common functions). In the current
state I imagine we would get something like 500 bugs for what amounts
to 50 actual problems that the Mesa or piglit could just as easily
tell us about. Not sure about nv50, but no one has seriously tackled
nv30 or nv40 in this area.

Thanks for the offer however.

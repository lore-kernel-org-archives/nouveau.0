From: "Justin Dugger" <jldugger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: XRandR 180
Date: Mon, 8 Oct 2007 03:12:31 -0500
Message-ID: <816bc7510710080112x5faa57afjb9fc87b9d2a075d3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

Does the current tree implement Rotate 180? I can see 0, 90 and 270,
but not 180.  This feature might sound silly at first glance, but it
happens to be highly useful for my convertible tablet laptop.  I've
browsed the current nv code and nouveau implementations, and it's
pretty clear that the older xrandr implementation did not do this.  Is
there some secret in xrandr1.2 that I'm not seeing, or is the function
also lacking in the current tree?

This change seems like a fairly simple 20-ish line of code patch to
support an additional rotation mode, but there's one thing I'm not
clear on: does pNV map to some register in hardware, or is it simply a
global state for the driver itself?

Justin Dugger

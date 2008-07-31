From: "Clemens Eisserer" <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Possible composition bug - please test
Date: Thu, 31 Jul 2008 12:42:08 +0200
Message-ID: <194f62550807310342x1265dccax2d8b29005461cd76@mail.gmail.com>
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

Hello,

I think I've stumbled over a composition bug (doesn't happen with
ExaNoComposite) which is also present in the Intel-Driver:
https://bugs.freedesktop.org/show_bug.cgi?id=16913

However the latest nouveau release I tested against was 0.10 (that one
shipped with Fedora9), and I don't have a spare system arround that I
could use for testing.

It would be really great if somebody running a more recent release
could try the source attached to the intel-bug-report, compile it
using:
gcc -lX11 -lXrender scale_clip_artifact2.c -o scale_clip_artifact
and just run it.

Thank you in advance and thanks for working on this really excellent
driver, Clemens

From: DJ Delorie <dj-Ht4Cp5ncgjRBDgjK7y7TUQ@public.gmane.org>
Subject: one desktop on four monitors ?
Date: Sun, 24 Oct 2010 00:26:48 -0400
Message-ID: <201010240426.o9O4Qm8w007081@envy.delorie.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


I've been trying for a while to get my setup to work with nouveau.
I'm currently using the nvidia blob with Fedora 12 with success, but
certain types of X operations kill performance.

I have two Nvidia 9800 GT video cards, each driving two monitors.

Card 0
     Monitor 0 = Dell 3008FP 2560x1600, in the middle of the cluster
     Monitor 1 = Dell 2001FP 1600x1200, above the middle
Card 1
     Monitor 0 = Dell 2001FP 1600x1200, left of middle, rotated right
     Monitor 1 = Dell 2001FP 1600x1200, right of middle, rotated right

So far, with Fedora 14 beta, I can do one of two things:

1. Each card is a separate randr display pair (i.e. two virtual
   monitors, two desktops)

2. Monitor 0 of each card is a xinerama pair, and each Monitor 1 is a
   clone of its Monitor 0.

While I'd prefer to use xrandr for these monitors, I've read that it's
just not supported yet (sigh).  At this point, I'd be happy if
xinerama worked!  Even if it only gave comparable performance to the
binary blob, it would make updating Fedora much easier.

Has *anyone* gotten a single desktop on >1 cards and >2 monitors yet?

DJ

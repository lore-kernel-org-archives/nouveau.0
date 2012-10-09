From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: Fix for potential nouveau-ddx/x-server crash on XOrg 1.12+
Date: Tue,  9 Oct 2012 09:06:58 +0200
Message-ID: <1349766419-2647-1-git-send-email-mario.kleiner@tuebingen.mpg.de>
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
Cc: ubuntu-x-nLRlyDuq1AZFpShjVBNYrg@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, bryce-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi all,

the following patch fixes a race-condition in the nouveau
ddx which caused frequent x-server crashes for at least 1
user under some loads when OpenGL triple-buffering is enabled,
which it is by default on XOrg 1.12 and later.

As a side effect, it provides a small optimization for the
common case of bufferswap at next vblank.

The other way to avoid the race + possible crash is
to set Option "SwapLimit" "1" in xorg.conf, but at a
performance loss due to double-buffering instead of
pseudo-triple-buffering.

Tested by me on Ubuntu 12.10 beta + XOrg 1.13 + nouveau-ddx
master, with/without triple-buffering, with/without compiz+unity,
with/without kms pageflipping.

Also successfully tested by Anssi Hannula, the original reporter
of the crash, on his setup.

Please review and apply if appropriate.

thanks,
-mario

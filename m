From: Joe Zeff <joe-6czteffKXy8@public.gmane.org>
Subject: Need help getting nouveau drivers working on Fedora 13
Date: Fri, 11 Jun 2010 15:47:23 -0700
Message-ID: <4C12BCFB.6070508@zeff.us>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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

My desktop computer uses a GeForce FX 5200 card and, when I was using 
Fedora 11, the kmod-nvidia drivers (a Fedora-specific repackaging of the 
binary blob) worked Just Fine.  Now, even though I've followed all of 
the instructions for them, they don't.  In fact, my system won't even 
complete booting if they're active.  (I'm posting from a laptop, while 
I'm trying to get my desktop up again.)  I've removed all of the nvidia 
packages and reinstalled Xorg; no mesa packages installed.  When I try 
to log in under X, I can see the desktop, briefly, long enough to see 
that my screenlets are loading in the wrong place, then, it's the 
infamous White Screen Of Death.  The desktop doesn't just turn white, 
it's more like a curtain being drawn down over it, that never comes back 
up.  Going to an alternate console and checking .xsession-errors, the 
last message that I can understand is from compiz, saying that it can't 
find some 8 bit pixmaps.

I'd greatly appreciate any pointers as to what I need to do, other than 
replace the video card (Not a pleasant option, because I've no reason to 
believe that it's gone bad.) to get my desktop back under control.  If 
there's any other info that you need, just ask.

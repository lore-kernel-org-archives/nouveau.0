From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28810] Blank consoles (Ctrl+Alt+Fn) after X starts
 on Arch Linux with FX5200 card.
Date: Sat,  3 Jul 2010 08:06:10 -0700 (PDT)
Message-ID: <20100703150610.D7C5013008C@annarchy.freedesktop.org>
References: <bug-28810-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-28810-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=28810

--- Comment #16 from Peter Hardman <peter-v4kLDURhBtCoPqikrtklHZJpZx93mCW/@public.gmane.org> 2010-07-03 08:06:09 PDT ---
Created an attachment (id=36724)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=36724)
Output of lspci -vvnn

Ouput of lspci -vvnn attached.

TBH now I've installed this card in my Windows machine I'm undecided whether
the false load detection is a bug or a 'feature'. The Windows installer fires
up a configurator after it's loaded the driver, and the first thing it tells
you is that you probably don't want the card configured as it is! It
initialises in the same mode the nouveau driver does 'Clone' with both TV and
VGA enabled and one overlaid on the other. The difference is that the VGA is on
top so if you don't understand what the configurator is telling you and leave
it alone no harm is done visually - so long as you really haven't got a TV and
no monitor - but maybe it can detect no monitor - I don't have a TV so can't
test that scenario. It also avoids the 'you must have xxx installed before you
can configure the driver' syndrome you often get with multi-function printers.

The xorg.conf Option lines added by nvidia-settings to disable TV don't work
for nouveau, but 'xrandr --output TV-1 --off' does work for X. 

Pete

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

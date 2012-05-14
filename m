From: rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org (Robert M. Riches Jr.)
Subject: any way to recover card after cursor disappears or card
	locks up
Date: Sun, 13 May 2012 21:11:10 -0700
Message-ID: <20120514041110.9A9E323420@one.localnet>
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

With an Asus ENGT430 card, which the box says is a GeForce GT 430,
and with 64-bit Mageia 1 with kernel 2.6.38.8-server-10.mga, about
once a week, the mouse cursor disappears from at least one monitor
or the display locks up when exiting X.  (I use runlevel 3 and
startx.)  Usually, if the cursor disappears and I then exit X, the
display will lock up showing the X root window background.  Once
the display has locked up, Alt-Ctrl-F* does nothing, SysRq does not
display anything (so I can't tell what it's doing).  However, I'm
able to ssh into the system, and everything other than the display
is fine.  After a reboot, everything seems fine.  I don't think I
saw this problem until I did a sensors-detect and added a second
monitor.  (Main monitor is on DVI, and second monitor is on HDMI.)
If I gather correctly, he GeForce GT 430 is an NVC1, GF108.

Is there any known way to recover from an invisible mouse cursor
or locked-up display other than rebooting?  I understand there is
functionality in the kernel to manually switch between virtual
consoles.  Can that be used to force the card to complete the
transition from X to a text console?

Thanks.

Robert Riches

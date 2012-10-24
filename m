From: rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org (Robert M. Riches Jr.)
Subject: message before driver went out to lunch
Date: Tue, 23 Oct 2012 17:41:37 -0700
Message-ID: <20121024004137.C6B1E26756@one.localnet>
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

Caught a message in /var/log/messages about the time Nouveau went
out to lunch:

Oct 22 19:40:12 one kernel: [drm] nouveau 0000:06:00.0: EvoCh 0 Mthd 0x0000 Data 0x00000400 (0x1002 0x01)

This was with kernel 2.6.38.8-server-10.mga on Mageia 1, and I
don't see any other version number in modinfo output.  The
graphics card is an Asus ENGT430.  Motherboard is an Asus P6T6 WS
Revolution.  CPU is a Xeon W3680.

At about the time this message was written, the system had been
driving two monitors.  A number of Firefox and other assorted
windows were on the first monitor, and Mythfrontend was playing
on the second (hanging a few pixels into the first due to a
separate X issue).  The first symptom was the mouse cursor
disappeared.  Window focus and such was perfectly fine, but the
cursor was not visible.  Then, in a minute or two, the cursor got
trapped on the second monitor.  A little later, the whole display
basically locked up.  Reloading the module, logging back in, and
starting X again cleared it up.

Does that message tell anything that might help reduce the
frequency of the display going out to lunch, requiring a reload
of the Nouveau module?

Thanks,

Robert

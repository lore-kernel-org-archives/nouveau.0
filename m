From: rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org (Robert M. Riches Jr.)
Subject: still seeking way to recover card after cursor disappears
	or card locks up
Date: Tue, 29 May 2012 21:25:32 -0700
Message-ID: <20120530042532.B56B023446@one.localnet>
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

A couple of weeks ago, I posted a question about how to recover
a card (an Asus ENGT430 card, which the box says is a GeForce GT
430, running Mageia 1 with kernel 2.6.38.8-server-10.mga) when
the cursor had disappeared or the card had locked up while exiting
X.  Thanks to Vincent Pelletier for for suggesting chvt.  That
command does work to change the console, just as Alt-Ctrl-F(n) for
1 <= n <= 12 does.  However, it does not recover a card to a fully
useful state.

A couple of days ago, I had two monitors working, and the card got
into a very odd state where one monitor would respond to chvt,
Alt-Ctrl-F(n), switching between X and a text console, and such,
but the other monitor was frozen.  Nothing involving chvt had any
effect on the unresponsive monitor.

Is there some other way to recover the card/driver to a useful
state?  Doing "shutdown -hF now" will do it, but that takes a long
time to being the system back up.

Is it considered safe to rmmod nouveau and then modprobe it back
again?  I have a diskless system with a different card I could try
that with to gain confidence if the list says it's safe to do that.

Thanks,

Robert Riches

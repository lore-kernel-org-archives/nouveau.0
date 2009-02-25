From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20298] Nouveau doesn't allow my modeline because of
 hardcoded value
Date: Wed, 25 Feb 2009 09:48:01 -0800 (PST)
Message-ID: <20090225174801.5F5E7130058@annarchy.freedesktop.org>
References: <bug-20298-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20298-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20298





--- Comment #1 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2009-02-25 09:48:00 PST ---
What other driver does this modeline work with?  I doubt it works with nv.

If you're using this successfully with the nvidia binary driver I'd like to see
what PLL setup they arrive at.  To do this, please do "git clone
git://anongit.freedesktop.org/~stuart/radeontool", then make, then dump some
regs as follows (while in X, with this mode set up, running the binary driver):

./radeontool regmatch 0x101000
./radeontool regmatch 0x680508
if your card is nv11 (geforce 2 mx) or newer please also do
./radeontool regmatch 0x680520
if your card is nv31 (geforce fx 5xxx) or newer please also do
./radeontool regmatch 0x680578
./radeontool regmatch 0x68057c
and if your card is nv41 (geforce 6xxx) or newer please also do
./radeontool regmatch 0x680580

and attach the values read (looks like "0x680580        0x00011e07 (73223)") as
a comment to this bug


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50175] [regression kernel 3.4] : nouveau detects
 internal laptop display as "disconnected" / screen is turned off
Date: Sat, 16 Jun 2012 20:21:14 +0000
Message-ID: <bug-50175-8800-KqYVxEzE3W@http.bugs.freedesktop.org/>
References: <bug-50175-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50175-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=50175

--- Comment #8 from WorMzy Tykashi <wormzy.tykashi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-06-16 13:21:14 PDT ---
Similar problem here, but not on a Sony laptop.

Booting with nomodeset appears to be the only way of successfully booting, but
then prevents the starting of X due to "No screens found". Without nomodeset,
screen goes into power savings mode (no video output), and boot does not appear
to complete (at least, I can't ssh into the affected PC).

I don't think this is a hardware-specific problem, but here's a list of my PC's
hardware, just in case:

Mobo: ASUS P8Z77-V PRO
Processor: Intel Core i5-3570K 3.4GHz
GFX: nVidia GeForce GTX 560 Ti

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

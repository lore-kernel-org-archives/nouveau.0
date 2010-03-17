From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27136] blank screen with G98 [Quadro NVS 420] (NV50)
 dual GPU, 4-head
Date: Wed, 17 Mar 2010 14:28:11 -0700 (PDT)
Message-ID: <20100317212811.530731300D8@annarchy.freedesktop.org>
References: <bug-27136-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27136-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=27136





--- Comment #4 from Colin Hudler <hudler-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2010-03-17 14:28:10 PST ---
I need to correct something I wrote earlier.  The card has NO DisplayPort
adapter, but something proprietary (?), which splits into a pair of connectors
each having two DVI ports (4 DVI in total).  Apparently, the driver only thinks
it is a DisplayPort.  Here's a crude drawing:

<NVS420>[PORT]-+---[DVI1][DVI3]
               |
               +---[DVI2][DVI4]

DVI1 and 3 are at PCI:5:0:0 , DVI2, DVI4 at PCI:6:0:0.  The primary display is
attached to DVI1, second at DVI2.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

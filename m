From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35901] two full hd displays (left and right) with
 nouveau does not work any more
Date: Fri, 15 Apr 2011 08:12:34 -0700 (PDT)
Message-ID: <20110415151234.D53AB13000C@annarchy.freedesktop.org>
References: <bug-35901-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35901-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35901

--- Comment #8 from Mario Bachmann <grafgrimm77-Mmb7MZpHnFY@public.gmane.org> 2011-04-15 08:12:33 PDT ---
Created an attachment (id=45669)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=45669)
kernel log of non-working configuration

this includes two display configurations:
1. one display on top, the other at the bottom:
  xrandr --output VGA-1 --mode 1920x1080
  xrandr --output DVI-D-1 --below VGA-1
Everything is fine.

2. one display left, the other display right:
  xrandr --output VGA-1 --mode 1920x1080
  xrandr --output DVI-D-1 --right-of VGA-1
the mouse coursor is fine, but everything else not! (-> i will provide a
screenshot soon!)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

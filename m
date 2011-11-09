From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 41114] nouveau module crashes on boot
Date: Wed, 09 Nov 2011 17:22:21 +0000
Message-ID: <bug-41114-8800-342pvOzn4i@http.bugs.freedesktop.org/>
References: <bug-41114-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-41114-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=41114

xavier.bru-6ktuUTfB/bM@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Version|git                         |unspecified

--- Comment #11 from xavier.bru-6ktuUTfB/bM@public.gmane.org 2011-11-09 09:22:21 PST ---
Hi Timo

Thanks for your answer. I worried with this option because when running lsmod
command the "nouveau" driver is present, but I could not see traces in
dmesg....
As a work-around, we also tried unsuccessfully to blacklist the driver
(rdblacklist=nouveau kernel boot parameter). 
Using the nouveau.disable=1 kernel boot parameter prevents the driver to be
loaded, but its a side effect (error on no "disable" option in the driver).
Is there a clean way to blacklist it ? 

Thanks again.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

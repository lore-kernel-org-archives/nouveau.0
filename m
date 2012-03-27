From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47846] Nouveau -> overscan using HDMI
Date: Tue, 27 Mar 2012 20:22:53 +0000
Message-ID: <bug-47846-8800-IqGiZ92fTw@http.bugs.freedesktop.org/>
References: <bug-47846-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-47846-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=47846

--- Comment #4 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-03-27 13:22:53 PDT ---
(In reply to comment #3)
> If its not possible to fix the root problem (EDID)...
A quick check indicates that there is no obvious "fix" in the EDID
There is a section of the EIA/CEA-861 extension block that indicates if
underscan is supported or not, but no exact numbers (dimensions etc.) are
specified

IMHO there should be a drm core function that parses the flag and deals with it
accordingly


> able to specify these underscan parameters to the kernel module.
Please feel free to send us an RFC/patch :)


> Now I have a new problem that I didn't have with nvidia proprietary driver.
> When running a fullscreen application, I get this:
> 
> X Error of failed request:  BadValue (integer parameter out of range for
> operation)
> ...
> I guess I'll open another bug report if I can't solve it by myself.
This is a separate issue, please provide more information in the newly opened
bug report - dmesg, Xorg.0.log, application name etc.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

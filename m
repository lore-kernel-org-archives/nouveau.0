From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28320] Xserver hangs in an infinite loop
Date: Tue, 15 Jun 2010 07:22:35 -0700 (PDT)
Message-ID: <20100615142235.812451300C9@annarchy.freedesktop.org>
References: <bug-28320-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-28320-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=28320

--- Comment #6 from Pavel S. <pav_s-KuiJ5kEpwI6ELgA04lAiVw@public.gmane.org> 2010-06-15 07:22:34 PDT ---
(In reply to comment #5)
> That " [mi] EQ overflowing" message is completely meaningless. Please, read
> http://marc.info/?l=fedora-devel-list&m=124101535025331&w=2 and then take a
> look at the disaster which happens when people start to file this message as a
> bug at https://bugzilla.redhat.com/show_bug.cgi?id=465884. 

Yes, I knew this, that ist why I looked into the GDB where the server was
hanging. I am not experienced with X debugging to understand this bug though,
so I decided to ask here.

> Much more interesting is this backtrace:

It looks to me that the server causes an deadlock in the kernel, and after that
it hopelessly hangs in that tight loop trying to get a response from the
kernel....

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

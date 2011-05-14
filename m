From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35441] header files (at least nouveau_device.h and
 nouveau_grojb.h) missing from git
Date: Sat, 14 May 2011 10:58:49 -0700 (PDT)
Message-ID: <20110514175849.6273113004F@annarchy.freedesktop.org>
References: <bug-35441-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35441-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35441

Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #45008|0                           |1
        is obsolete|                            |
  Attachment #45009|0                           |1
        is obsolete|                            |
  Attachment #45037|0                           |1
        is obsolete|                            |
  Attachment #45038|0                           |1
        is obsolete|                            |

--- Comment #14 from Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org> 2011-05-14 10:58:48 PDT ---
Created an attachment (id=46722)
 View: https://bugs.freedesktop.org/attachment.cgi?id=46722
 Review: https://bugs.freedesktop.org/review?bug=35441&attachment=46722

Final fix!

This patches fixes whole compiling.

Tested on openSUSE (with and without --enable-shared-dricore).

https://build.opensuse.org/package/show?package=Mesa&project=home%3Ajobermayr
(with --enable-shared-dricore)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

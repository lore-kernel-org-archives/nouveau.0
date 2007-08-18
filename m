From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 11993] Native YV12 overlay bandwidth problems
Date: Fri, 17 Aug 2007 17:19:39 -0700 (PDT)
Message-ID: <20070818001939.AC4C013005D@annarchy.freedesktop.org>
References: <bug-11993-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-11993-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=11993


arthur.huillet-dFvTVMYgtfk@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         AssignedTo|nouveau-PD4FTy7X32lNgt0PjOBp9/EVdHwE84te@public.gmane.org|arthur.huillet-dFvTVMYgtfk@public.gmane.org
                   |g                           |
           Severity|normal                      |minor
             Status|NEW                         |ASSIGNED
           Priority|medium                      |low




------- Comment #1 from arthur.huillet-dFvTVMYgtfk@public.gmane.org  2007-08-17 17:19 PST -------
I worked around problems by uploading only the part of the image that is
actually displayed, so that the source point actually is always 0,0, and the
source image is no larger than the user's screen.
This fixed problems on my computer but I am waiting for more testing reports
befor e closing this bug as fixed.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
You are the assignee for the bug, or are watching the assignee.

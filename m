From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39498] nouveau hangs on unresponsive black screen at
	startup
Date: Mon, 25 Jul 2011 23:03:30 -0700 (PDT)
Message-ID: <20110726060330.7B6211300D3@annarchy.freedesktop.org>
References: <bug-39498-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39498-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39498

Guido Trentalancia <guido-D1bseh+SzQikhjTqA1DzBQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         AssignedTo|nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org |guido-D1bseh+SzQikhjTqA1DzBQ@public.gmane.org
                   |rg                          |

--- Comment #23 from Guido Trentalancia <guido-D1bseh+SzQikhjTqA1DzBQ@public.gmane.org> 2011-07-25 23:03:29 PDT ---
Created an attachment (id=49551)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=49551)
Logs for Nouveau driver (git) working with acceleration (after few changes
mainly from openSUSE/jobermayr))

Logs for Nouveau driver (git) working with acceleration (after few changes
mainly from openSUSE/jobermayr and mainly to Mesa build options).

Need to find root cause of the bloody NoAccel problem resulting in black screen
hang. It could be just Mesa build options but it needs to be carefully analysed
and documented where most appropriate.

The only odd thing in Xorg.log is:

[   177.426] (II) AIGLX: Loaded and initialized /usr/lib64/dri/swrast_dri.so
[   177.426] (II) GLX: Initialized DRISWRAST GL provider for screen 0

What does that really mean ? I hope not that it's using the software
rasterizer.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

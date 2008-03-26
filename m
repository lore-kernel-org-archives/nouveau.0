From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14345] Image with width greater than 8176 pixel make
 firefox crash with X error
Date: Wed, 26 Mar 2008 08:15:31 -0700 (PDT)
Message-ID: <20080326151533.031B713014A@annarchy.freedesktop.org>
References: <bug-14345-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14345-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14345


Victor Stinner <victor.stinner-XgyrR7WU8tJ8UrSeD/g0lQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |victor.stinner-XgyrR7WU8tJ8UrSeD/g0lQ@public.gmane.org




--- Comment #8 from Victor Stinner <victor.stinner-XgyrR7WU8tJ8UrSeD/g0lQ@public.gmane.org>  2008-03-26 08:15:31 PST ---
Using Xorg 7.3 / Xserver 1.4 and today git, it still crashs with:
 The program 'firefox-bin' received an X Window System error.
 This probably reflects a bug in the program.
 The error was 'BadAlloc (insufficient resources for operation)'.
   (Details: serial 22204 error_code 11 request_code 53 minor_code 0)
   (Note to programmers: normally, X errors are reported asynchronously;
    that is, you will receive the error a while after causing it.
    To debug your program, run it with the --sync command line
    option to change this behavior. You can then get a meaningful
    backtrace from your debugger if you break on the gdk_x_error() function.)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 42921] New: Program received an X Window System
	error.
Date: Mon, 14 Nov 2011 13:15:08 +0000
Message-ID: <bug-42921-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

https://bugs.freedesktop.org/show_bug.cgi?id=42921

             Bug #: 42921
           Summary: Program received an X Window System error.
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: fox_gwhwup-jgFg43Yc3kMJGwgDXS7ZQA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 53522
  --> https://bugs.freedesktop.org/attachment.cgi?id=53522
Xorg log

I'm working on a GUI toolkit for Pygame, which can be downloaded at
https://launchpad.net/simplegc

Trying to run my example file in the project results in the following error:
s@s-Air:~/Games/Tools/sgc/trunk/sgc/example$ python test.py 
The program 'test.py' received an X Window System error.
This probably reflects a bug in the program.
The error was 'BadDrawable (invalid Pixmap or Window parameter)'.
  (Details: serial 36 error_code 9 request_code 137 minor_code 8)
  (Note to programmers: normally, X errors are reported asynchronously;
   that is, you will receive the error a while after causing it.
   To debug your program, run it with the --sync command line
   option to change this behavior. You can then get a meaningful
   backtrace from your debugger if you break on the gdk_x_error() function.)

The error doesn't occur until the code hits pygame.display.flip(), which makes
it rather difficult to work out exactly which part is causing the problem. I'm
using the menu widget in the game I am working on and it works perfectly, so
it's obviously not the entire toolkit that's not working.

I'm not sure if this should be in the 3D section, as the bug is when running in
OpenGL, but I'm only drawing in 2D. It still works fine the pygame/SDL, just
not when I switch it to OpenGL.

I have checked this with the proprietary Nvidia driver and it works fine there,
it's just when running the Nouveau driver.

I'm not sure how to find out all the versions, but it's whatever an up-to-date
Ubuntu 11.10 is running.

Please tell me if you have any ideas on how to track the bug down. If you want
to try to recreate the bug on your machine download the toolkit from above, and
ensure you have python 2.x, pygame, pyopengl and pyFTGL installed. Then change
the two lines near the top of the test.py file to enable OpenGL, and finally cd
into the example folder and run 'python test.py'.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

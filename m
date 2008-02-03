From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14345] New: Image with width greater than 8176 pixel
 make firefox crash with X error
Date: Sun,  3 Feb 2008 04:25:12 -0800 (PST)
Message-ID: <bug-14345-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

           Summary: Image with width greater than 8176 pixel make firefox
                    crash with X error
           Product: xorg
           Version: 7.2
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: mjulien.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=14113)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=14113)
Image 8177x1 pixel, make firefox crash

Hi,

with Nouveau, image greater than 8176 pixel make firefox (2.x and 3.0) crash
with this error :

The program 'gecko' received an X Window System error.
This probably reflects a bug in the program.
The error was 'BadAlloc (insufficient resources for operation)'.
  (Details: serial 2281 error_code 11 request_code 53 minor_code 0)
  (Note to programmers: normally, X errors are reported asynchronously;
   that is, you will receive the error a while after causing it.
   To debug your program, run it with the --sync command line
   option to change this behavior. You can then get a meaningful
   backtrace from your debugger if you break on the gdk_x_error() function.)


Konqueror doesn't crash but doesn't display the image and print :

X Error: BadAlloc (insufficient resources for operation) 11
  Major opcode:  53
  Minor opcode:  0
  Resource id:  0x26003c3
X Error: BadDrawable (invalid Pixmap or Window parameter) 9
  Major opcode:  72
  Minor opcode:  0
  Resource id:  0x26003c3
X Error: BadDrawable (invalid Pixmap or Window parameter) 9
  Major opcode:  72
  Minor opcode:  0
  Resource id:  0x26003c3
X Error: BadDrawable (invalid Pixmap or Window parameter) 9
  Major opcode:  72
  Minor opcode:  0
  Resource id:  0x26003c3
X Error: BadDrawable (invalid Pixmap or Window parameter) 9
  Major opcode:  72
  Minor opcode:  0
  Resource id:  0x26003c3
X Error: BadDrawable (invalid Pixmap or Window parameter) 9
  Major opcode:  72
  Minor opcode:  0
  Resource id:  0x26003c3
X Error: BadDrawable (invalid Pixmap or Window parameter) 9
  Major opcode:  72
  Minor opcode:  0
  Resource id:  0x26003c3
X Error: BadDrawable (invalid Pixmap or Window parameter) 9
  Major opcode:  72
  Minor opcode:  0
  Resource id:  0x26003c3
X Error: BadDrawable (invalid Pixmap or Window parameter) 9
  Major opcode:  72
  Minor opcode:  0
  Resource id:  0x26003c3
X Error: BadDrawable (invalid Pixmap or Window parameter) 9
  Major opcode:  72
  Minor opcode:  0
  Resource id:  0x26003c3
X Error: BadDrawable (invalid Pixmap or Window parameter) 9
  Major opcode:  72
  Minor opcode:  0
  Resource id:  0x26003c3
X Error: BadDrawable (invalid Pixmap or Window parameter) 9
  Major opcode:  72
  Minor opcode:  0
  Resource id:  0x26003c3
X Error: BadDrawable (invalid Pixmap or Window parameter) 9
  Major opcode:  72
  Minor opcode:  0
  Resource id:  0x26003c3
X Error: BadDrawable (invalid Pixmap or Window parameter) 9
  Major opcode:  72
  Minor opcode:  0
  Resource id:  0x26003c3
X Error: BadDrawable (invalid Pixmap or Window parameter) 9
  Major opcode:  72
  Minor opcode:  0
  Resource id:  0x26003c3
X Error: BadDrawable (invalid Pixmap or Window parameter) 9
  Major opcode:  72
  Minor opcode:  0
  Resource id:  0x26003c3
X Error: BadDrawable (invalid Pixmap or Window parameter) 9
  Major opcode:  155
  Minor opcode:  4
  Resource id:  0x26003c3
X Error: BadDrawable (invalid Pixmap or Window parameter) 9
  Major opcode:  62
  Minor opcode:  0
  Resource id:  0x26003c3
X Error: BadDrawable (invalid Pixmap or Window parameter) 9
  Major opcode:  62
  Minor opcode:  0
  Resource id:  0x26003c3
X Error of failed request:  RenderBadPicture (invalid Picture parameter)
  Major opcode of failed request:  155 (RENDER)
  Minor opcode of failed request:  7 (RenderFreePicture)
  Picture id in failed request: 0x26003c6
  Serial number of failed request:  9414
  Current serial number in output stream:  9827


Opera display the image fine

With nv driver and proprietary nvidia driver, firefox displays the image and
doesn't crash.

I don't see anything in logs related to this problem (though I didn't insert
drm with debug option).


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

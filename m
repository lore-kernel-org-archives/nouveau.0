From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69928] [NVAA] Boot of linux kernel 3.12-rc2 hangs
Date: Wed, 16 Oct 2013 08:53:22 +0000
Message-ID: <bug-69928-8800-11OrqYjGni@http.bugs.freedesktop.org/>
References: <bug-69928-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0917672448=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69928-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0917672448==
Content-Type: multipart/alternative; boundary="1381913602.61fe1.15620"; charset="us-ascii"


--1381913602.61fe1.15620
Date: Wed, 16 Oct 2013 08:53:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69928

--- Comment #10 from dirkneukirchen-S0/GAf8tV78@public.gmane.org ---
Created attachment 87714
  --> https://bugs.freedesktop.org/attachment.cgi?id=87714&action=edit
output /proc/interrupts every 1 second with nvidia-304

/proc/interrupts is attached from one "test" run of 
with a parallel mmiotrace

xinit nvidia-settings
(browse through some menus, then quit)
(somehow xinit "sleep 20" wasnt really working this time because some shell
issue )

from the recovery console
- Kernel was 3.8.0-19 default provided by Ubuntu 13.04 (like above)
like before

Do you need proc/interrupts from a normal user desktop too ?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381913602.61fe1.15620
Date: Wed, 16 Oct 2013 08:53:22 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVAA] Boot of linux kernel 3.12-rc2 hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69928#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVAA] Boot of linux kernel 3.12-rc2 hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69928">bug 69928</a>
              from <span class="vcard"><a class="email" href="mailto:dirkneukirchen&#64;web.de" title="dirkneukirchen&#64;web.de">dirkneukirchen&#64;web.de</a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=87714" name="attach_87714" title="output /proc/interrupts every 1 second with nvidia-304">attachment 87714</a> <a href="attachment.cgi?id=87714&amp;action=edit" title="output /proc/interrupts every 1 second with nvidia-304">[details]</a></span>
output /proc/interrupts every 1 second with nvidia-304

/proc/interrupts is attached from one &quot;test&quot; run of 
with a parallel mmiotrace

xinit nvidia-settings
(browse through some menus, then quit)
(somehow xinit &quot;sleep 20&quot; wasnt really working this time because some shell
issue )

from the recovery console
- Kernel was 3.8.0-19 default provided by Ubuntu 13.04 (like above)
like before

Do you need proc/interrupts from a normal user desktop too ?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381913602.61fe1.15620--

--===============0917672448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0917672448==--

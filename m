From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89730] NV50: LightDM GTK+ Greeter Background -
 inconsistent display
Date: Fri, 29 May 2015 00:49:11 +0000
Message-ID: <bug-89730-8800-YqyjZxWWiK@http.bugs.freedesktop.org/>
References: <bug-89730-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1007279709=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89730-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1007279709==
Content-Type: multipart/alternative; boundary="1432860550.BD87c1.26520"; charset="UTF-8"


--1432860550.BD87c1.26520
Date: Fri, 29 May 2015 00:49:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89730

--- Comment #29 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to andrew p. from comment #28)
> (In reply to poma from comment #27)
> > Here, that's all, no "wrapper".
> lightdm-gtk-greeter.desktop must be ok:
> 
>     Exec=xtrace -b -o /tmp/xtrace.log lightdm-gtk-greeter


# cat /usr/share/xgreeters/lightdm-gtk-greeter.desktop.old
[Desktop Entry]
Name=LightDM GTK+ Greeter
Comment=This runs the GTK+ greeter, it should only be run from LightDM
Exec=xtrace -b -o /tmp/xtrace.log lightdm-gtk-greeter
Type=Application
X-Ubuntu-Gettext-Domain=lightdm


# cat /var/log/lightdm/lightdm.log.old
...
[+0.53s] DEBUG: Seat seat0: Display server ready, starting session
authentication
[+0.53s] DEBUG: Session pid=13245: Started with service 'lightdm-greeter',
username 'lightdm'
[+0.57s] DEBUG: Session pid=13245: Authentication complete with return value 0:
Success
[+0.57s] DEBUG: Seat seat0: Session authenticated, running command
[+0.57s] DEBUG: Session pid=13245: Running command /usr/bin/xtrace -b -o
/tmp/xtrace.log lightdm-gtk-greeter
[+0.57s] DEBUG: Creating shared data directory /var/lib/lightdm-data/lightdm
[+0.57s] DEBUG: Session pid=13245: Logging to /var/log/lightdm/x-0-greeter.log
[+0.61s] DEBUG: Activating VT 1
[+0.61s] DEBUG: Activating login1 session c52
[+0.61s] DEBUG: Seat seat0 changes active session to c52
[+0.61s] DEBUG: Session c52 is already active
[+0.61s] DEBUG: Session pid=13245: Greeter closed communication channel
[+0.62s] DEBUG: Session pid=13245: Exited with return value 0
[+0.62s] DEBUG: Seat seat0: Session stopped
[+0.62s] DEBUG: Seat seat0: Stopping; failed to start a greeter
[+0.62s] DEBUG: Seat seat0: Stopping
[+0.62s] DEBUG: Seat seat0: Stopping display server
[+0.62s] DEBUG: Sending signal 15 to process 13235
[+0.62s] DEBUG: Seat seat0 changes active session to 
[+0.62s] CRITICAL: session_get_login1_session_id: assertion 'session != NULL'
failed
[+0.87s] DEBUG: Process 13235 exited with return value 0
[+0.87s] DEBUG: DisplayServer x-0: X server stopped
[+0.87s] DEBUG: Releasing VT 1
[+0.87s] DEBUG: DisplayServer x-0: Removing X server authority
/var/run/lightdm/root/:0
[+0.87s] DEBUG: Seat seat0: Display server stopped
[+0.87s] DEBUG: Seat seat0: Stopped
[+0.87s] DEBUG: Required seat has stopped
[+0.87s] DEBUG: Stopping display manager
[+0.87s] DEBUG: Display manager stopped
[+0.87s] DEBUG: Stopping daemon
[+0.87s] DEBUG: Exiting with return value 1


# cat /var/log/lightdm/x-0-greeter.log.old
executable `-b' not found
Try `xtrace --help' or `xtrace --usage' for more information.


# xtrace --help
Usage: xtrace [OPTION]... PROGRAM [PROGRAMOPTION]...
Trace execution of program by printing currently executed function.

     --data=FILE          Don't run the program, just print the data from FILE.

   -?,--help              Print this help and exit
      --usage             Give a short usage message
   -V,--version           Print version information and exit

Mandatory arguments to long options are also mandatory for any corresponding
short options.

For bug reporting instructions, please see:
<http://www.gnu.org/software/libc/bugs.html>.


# xtrace --version
xtrace (GNU libc) 2.20
Copyright (C) 2014 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
Written by Ulrich Drepper.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432860550.BD87c1.26520
Date: Fri, 29 May 2015 00:49:10 +0000
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
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730#c29">Comment # 29</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730">bug 89730</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>(In reply to andrew p. from <a href="show_bug.cgi?id=89730#c28">comment #28</a>)
<span class="quote">&gt; (In reply to poma from <a href="show_bug.cgi?id=89730#c27">comment #27</a>)
&gt; &gt; Here, that's all, no &quot;wrapper&quot;.
&gt; lightdm-gtk-greeter.desktop must be ok:
&gt; 
&gt;     Exec=xtrace -b -o /tmp/xtrace.log lightdm-gtk-greeter</span >


# cat /usr/share/xgreeters/lightdm-gtk-greeter.desktop.old
[Desktop Entry]
Name=LightDM GTK+ Greeter
Comment=This runs the GTK+ greeter, it should only be run from LightDM
Exec=xtrace -b -o /tmp/xtrace.log lightdm-gtk-greeter
Type=Application
X-Ubuntu-Gettext-Domain=lightdm


# cat /var/log/lightdm/lightdm.log.old
...
[+0.53s] DEBUG: Seat seat0: Display server ready, starting session
authentication
[+0.53s] DEBUG: Session pid=13245: Started with service 'lightdm-greeter',
username 'lightdm'
[+0.57s] DEBUG: Session pid=13245: Authentication complete with return value 0:
Success
[+0.57s] DEBUG: Seat seat0: Session authenticated, running command
[+0.57s] DEBUG: Session pid=13245: Running command /usr/bin/xtrace -b -o
/tmp/xtrace.log lightdm-gtk-greeter
[+0.57s] DEBUG: Creating shared data directory /var/lib/lightdm-data/lightdm
[+0.57s] DEBUG: Session pid=13245: Logging to /var/log/lightdm/x-0-greeter.log
[+0.61s] DEBUG: Activating VT 1
[+0.61s] DEBUG: Activating login1 session c52
[+0.61s] DEBUG: Seat seat0 changes active session to c52
[+0.61s] DEBUG: Session c52 is already active
[+0.61s] DEBUG: Session pid=13245: Greeter closed communication channel
[+0.62s] DEBUG: Session pid=13245: Exited with return value 0
[+0.62s] DEBUG: Seat seat0: Session stopped
[+0.62s] DEBUG: Seat seat0: Stopping; failed to start a greeter
[+0.62s] DEBUG: Seat seat0: Stopping
[+0.62s] DEBUG: Seat seat0: Stopping display server
[+0.62s] DEBUG: Sending signal 15 to process 13235
[+0.62s] DEBUG: Seat seat0 changes active session to 
[+0.62s] CRITICAL: session_get_login1_session_id: assertion 'session != NULL'
failed
[+0.87s] DEBUG: Process 13235 exited with return value 0
[+0.87s] DEBUG: DisplayServer x-0: X server stopped
[+0.87s] DEBUG: Releasing VT 1
[+0.87s] DEBUG: DisplayServer x-0: Removing X server authority
/var/run/lightdm/root/:0
[+0.87s] DEBUG: Seat seat0: Display server stopped
[+0.87s] DEBUG: Seat seat0: Stopped
[+0.87s] DEBUG: Required seat has stopped
[+0.87s] DEBUG: Stopping display manager
[+0.87s] DEBUG: Display manager stopped
[+0.87s] DEBUG: Stopping daemon
[+0.87s] DEBUG: Exiting with return value 1


# cat /var/log/lightdm/x-0-greeter.log.old
executable `-b' not found
Try `xtrace --help' or `xtrace --usage' for more information.


# xtrace --help
Usage: xtrace [OPTION]... PROGRAM [PROGRAMOPTION]...
Trace execution of program by printing currently executed function.

     --data=FILE          Don't run the program, just print the data from FILE.

   -?,--help              Print this help and exit
      --usage             Give a short usage message
   -V,--version           Print version information and exit

Mandatory arguments to long options are also mandatory for any corresponding
short options.

For bug reporting instructions, please see:
&lt;<a href="http://www.gnu.org/software/libc/bugs.html">http://www.gnu.org/software/libc/bugs.html</a>&gt;.


# xtrace --version
xtrace (GNU libc) 2.20
Copyright (C) 2014 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
Written by Ulrich Drepper.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432860550.BD87c1.26520--

--===============1007279709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1007279709==--

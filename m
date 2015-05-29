From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89730] NV50: LightDM GTK+ Greeter Background -
 inconsistent display
Date: Fri, 29 May 2015 02:36:46 +0000
Message-ID: <bug-89730-8800-iIj4Hl1130@http.bugs.freedesktop.org/>
References: <bug-89730-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1817981619=="
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


--===============1817981619==
Content-Type: multipart/alternative; boundary="1432867006.F728f1.23077"; charset="UTF-8"


--1432867006.F728f1.23077
Date: Fri, 29 May 2015 02:36:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89730

--- Comment #33 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

# cat /usr/share/xgreeters/lightdm-gtk-greeter.desktop.old
[Desktop Entry]
Name=LightDM GTK+ Greeter
Comment=This runs the GTK+ greeter, it should only be run from LightDM
Exec=x11trace -b -o /tmp/xtrace.log lightdm-gtk-greeter
Type=Application
X-Ubuntu-Gettext-Domain=lightdm


# file /tmp/xtrace.log 
/tmp/xtrace.log: empty


# cat /var/log/lightdm/lightdm.log.old
...
[+0.57s] DEBUG: Seat seat0: Display server ready, starting session
authentication
[+0.57s] DEBUG: Session pid=3421: Started with service 'lightdm-greeter',
username 'lightdm'
[+0.61s] DEBUG: Session pid=3421: Authentication complete with return value 0:
Success
[+0.61s] DEBUG: Seat seat0: Session authenticated, running command
[+0.61s] DEBUG: Session pid=3421: Running command /usr/bin/x11trace -b -o
/tmp/xtrace.log lightdm-gtk-greeter
[+0.61s] DEBUG: Creating shared data directory /var/lib/lightdm-data/lightdm
[+0.61s] DEBUG: Session pid=3421: Logging to /var/log/lightdm/x-0-greeter.log
[+0.69s] DEBUG: Activating VT 1
[+0.69s] DEBUG: Activating login1 session c6
[+0.69s] DEBUG: Seat seat0 changes active session to c6
[+0.69s] DEBUG: Session c6 is already active
[+0.70s] DEBUG: Session pid=3421: Greeter closed communication channel
[+0.71s] DEBUG: Session pid=3421: Exited with return value 0
[+0.71s] DEBUG: Seat seat0: Session stopped
[+0.71s] DEBUG: Seat seat0: Stopping; failed to start a greeter
[+0.71s] DEBUG: Seat seat0: Stopping
[+0.71s] DEBUG: Seat seat0: Stopping display server
[+0.71s] DEBUG: Sending signal 15 to process 3405
[+0.71s] DEBUG: Seat seat0 changes active session to 
[+0.71s] CRITICAL: session_get_login1_session_id: assertion 'session != NULL'
failed
[+1.00s] DEBUG: Process 3405 exited with return value 0
[+1.00s] DEBUG: DisplayServer x-0: X server stopped
[+1.00s] DEBUG: Releasing VT 1
[+1.00s] DEBUG: DisplayServer x-0: Removing X server authority
/var/run/lightdm/root/:0
[+1.00s] DEBUG: Seat seat0: Display server stopped
[+1.00s] DEBUG: Seat seat0: Stopped
[+1.00s] DEBUG: Required seat has stopped
[+1.00s] DEBUG: Stopping display manager
[+1.00s] DEBUG: Display manager stopped
[+1.00s] DEBUG: Stopping daemon
[+1.00s] DEBUG: Exiting with return value 1


# cat /var/log/lightdm/x-0-greeter.log.old
No display name to create specified, trying :9
Error binding socket for ':9': 98=Address already in use

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432867006.F728f1.23077
Date: Fri, 29 May 2015 02:36:46 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730#c33">Comment # 33</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730">bug 89730</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
# cat /usr/share/xgreeters/lightdm-gtk-greeter.desktop.old
[Desktop Entry]
Name=LightDM GTK+ Greeter
Comment=This runs the GTK+ greeter, it should only be run from LightDM
Exec=x11trace -b -o /tmp/xtrace.log lightdm-gtk-greeter
Type=Application
X-Ubuntu-Gettext-Domain=lightdm


# file /tmp/xtrace.log 
/tmp/xtrace.log: empty


# cat /var/log/lightdm/lightdm.log.old
...
[+0.57s] DEBUG: Seat seat0: Display server ready, starting session
authentication
[+0.57s] DEBUG: Session pid=3421: Started with service 'lightdm-greeter',
username 'lightdm'
[+0.61s] DEBUG: Session pid=3421: Authentication complete with return value 0:
Success
[+0.61s] DEBUG: Seat seat0: Session authenticated, running command
[+0.61s] DEBUG: Session pid=3421: Running command /usr/bin/x11trace -b -o
/tmp/xtrace.log lightdm-gtk-greeter
[+0.61s] DEBUG: Creating shared data directory /var/lib/lightdm-data/lightdm
[+0.61s] DEBUG: Session pid=3421: Logging to /var/log/lightdm/x-0-greeter.log
[+0.69s] DEBUG: Activating VT 1
[+0.69s] DEBUG: Activating login1 session c6
[+0.69s] DEBUG: Seat seat0 changes active session to c6
[+0.69s] DEBUG: Session c6 is already active
[+0.70s] DEBUG: Session pid=3421: Greeter closed communication channel
[+0.71s] DEBUG: Session pid=3421: Exited with return value 0
[+0.71s] DEBUG: Seat seat0: Session stopped
[+0.71s] DEBUG: Seat seat0: Stopping; failed to start a greeter
[+0.71s] DEBUG: Seat seat0: Stopping
[+0.71s] DEBUG: Seat seat0: Stopping display server
[+0.71s] DEBUG: Sending signal 15 to process 3405
[+0.71s] DEBUG: Seat seat0 changes active session to 
[+0.71s] CRITICAL: session_get_login1_session_id: assertion 'session != NULL'
failed
[+1.00s] DEBUG: Process 3405 exited with return value 0
[+1.00s] DEBUG: DisplayServer x-0: X server stopped
[+1.00s] DEBUG: Releasing VT 1
[+1.00s] DEBUG: DisplayServer x-0: Removing X server authority
/var/run/lightdm/root/:0
[+1.00s] DEBUG: Seat seat0: Display server stopped
[+1.00s] DEBUG: Seat seat0: Stopped
[+1.00s] DEBUG: Required seat has stopped
[+1.00s] DEBUG: Stopping display manager
[+1.00s] DEBUG: Display manager stopped
[+1.00s] DEBUG: Stopping daemon
[+1.00s] DEBUG: Exiting with return value 1


# cat /var/log/lightdm/x-0-greeter.log.old
No display name to create specified, trying :9
Error binding socket for ':9': 98=Address already in use</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432867006.F728f1.23077--

--===============1817981619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1817981619==--

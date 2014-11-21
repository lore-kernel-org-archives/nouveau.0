From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51579] [NVA8] Xv shows black image on ION chipset
Date: Fri, 21 Nov 2014 11:51:08 +0000
Message-ID: <bug-51579-8800-uGJy0LMaNu@http.bugs.freedesktop.org/>
References: <bug-51579-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0913687852=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51579-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0913687852==
Content-Type: multipart/alternative; boundary="1416570668.0B2c73.16686"; charset="UTF-8"


--1416570668.0B2c73.16686
Date: Fri, 21 Nov 2014 11:51:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51579

lameventanas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|FIXED                       |---

--- Comment #31 from lameventanas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I'm sorry to say this, but the bug is still there, it comes at goes at random
between reboots.

Now I am running:
kernel 3.15.0
xorg-xf86-video-nouveau 1.0.11

And mplayer -vo xv was working fine a minute ago.  Then I rebooted the computer
and now the video plays (can hear audio), but a black screen again.

I tested again several times after restarting X, and still get a black window.
Unfortunately I can't test rmmod nouveau, because I built it in the kernel.

I see this in my Xorg log:

bash$ egrep 'WW|EE' /var/log/Xorg.0.log.old 
[  1057.575] Current Operating System: Linux hostname 3.15.0 #8 SMP PREEMPT Thu
Nov 20 10:00:10 JST 2014 x86_64
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[  1057.576] (WW) The directory "/usr/share/fonts/X11/OTF/" does not exist.
[  1057.577] (EE) systemd-logind: failed to get session: The name
org.freedesktop.login1 was not provided by any .service files
[  1057.746] (EE) NOUVEAU(0): [COPY] failed to allocate class.
[  1117.476] (EE) Server terminated successfully (0). Closing log file.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416570668.0B2c73.16686
Date: Fri, 21 Nov 2014 11:51:08 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:lameventanas&#64;gmail.com" title="lameventanas&#64;gmail.com">lameventanas&#64;gmail.com</a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [NVA8] Xv shows black image on ION chipset"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51579">bug 51579</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>FIXED
           </td>
           <td>---
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [NVA8] Xv shows black image on ION chipset"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51579#c31">Comment # 31</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [NVA8] Xv shows black image on ION chipset"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51579">bug 51579</a>
              from <span class="vcard"><a class="email" href="mailto:lameventanas&#64;gmail.com" title="lameventanas&#64;gmail.com">lameventanas&#64;gmail.com</a>
</span></b>
        <pre>I'm sorry to say this, but the bug is still there, it comes at goes at random
between reboots.

Now I am running:
kernel 3.15.0
xorg-xf86-video-nouveau 1.0.11

And mplayer -vo xv was working fine a minute ago.  Then I rebooted the computer
and now the video plays (can hear audio), but a black screen again.

I tested again several times after restarting X, and still get a black window.
Unfortunately I can't test rmmod nouveau, because I built it in the kernel.

I see this in my Xorg log:

bash$ egrep 'WW|EE' /var/log/Xorg.0.log.old 
[  1057.575] Current Operating System: Linux hostname 3.15.0 #8 SMP PREEMPT Thu
Nov 20 10:00:10 JST 2014 x86_64
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[  1057.576] (WW) The directory &quot;/usr/share/fonts/X11/OTF/&quot; does not exist.
[  1057.577] (EE) systemd-logind: failed to get session: The name
org.freedesktop.login1 was not provided by any .service files
[  1057.746] (EE) NOUVEAU(0): [COPY] failed to allocate class.
[  1117.476] (EE) Server terminated successfully (0). Closing log file.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416570668.0B2c73.16686--

--===============0913687852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0913687852==--

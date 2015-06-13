From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90967] New: System freeze using nouveau
Date: Sat, 13 Jun 2015 10:10:54 +0000
Message-ID: <bug-90967-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0019310445=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0019310445==
Content-Type: multipart/alternative; boundary="1434190254.030C1.29377"; charset="UTF-8"


--1434190254.030C1.29377
Date: Sat, 13 Jun 2015 10:10:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90967

            Bug ID: 90967
           Summary: System freeze using nouveau
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jerome-lLmxdfRNSPJWj0EZb7rXcA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Hi.

Sometimes, my system freezes. No keyboard, no CTRL+Fx, altough I can REISUB.
The mouse moves but the screen is frozen so it can't click anywhere.

I tried to wait two or three minutes but nothing happens so I generally REISUB.

Is there a point waiting any longer ? A timeout / watchdog of any kind ?

When I switch the computer on, after logging with my user, before the desktop
displays (background, panels, etc.), I get some kind of broken mozaic of images
from my sessions before the failure (not images diplayed on frozen screen,
rather images from different pages of my browser that where open when it
occured).

It seems to happen randomly, so I can't reproduce systematically, but I think
it always happens when I'm watching a video (using vlc) and my brower is
running, maybe some other apps like mail-client, and it could be linked to a
specific user action (like moving window, or changing focus,...) because I
don't remember it happening while I'm just sitting away from the keyboard, like
watching a movie.

Today, instead of REISUBing, I went to another computer to access mine through
SSH. When I came back, lightdm was waiting for my user/pwd. Considering the
uptime and the dates of /var/log/Xorg.0.log.old, I guess Xorg was restarted.
When logging in, I didn't get the mozaic.

I doubt it is another bug, so maybe Xorg was restarted due to me waiting longer
than usual, or, more doubtedly, my remote logging. And I didn't get the mozaic
because nouveau's buffer were flushed more cleanly than with REISUB.

Anyway, I don't know much about graphics, so I can't make more guesses and I
can't tell whether this is a duplicate or not.

My system is an up-to-date Debian Jessie.

xserver-xorg-video-nouveau -> 1:1.0.11-1
Linux 3.16.0-4-amd64 #1 SMP Debian 3.16.7-ckt11-1 (2015-05-24) x86_64 GNU/Linux

Attaching dmesg output (same now than when remotely logged in, nothing about
Xorg reboot or anything since the freeze).

Also attaching /var/log/Xorg.0.log.old.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1434190254.030C1.29377
Date: Sat, 13 Jun 2015 10:10:54 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - System freeze using nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90967">90967</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>System freeze using nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>jerome&#64;jolimont.fr
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hi.

Sometimes, my system freezes. No keyboard, no CTRL+Fx, altough I can REISUB.
The mouse moves but the screen is frozen so it can't click anywhere.

I tried to wait two or three minutes but nothing happens so I generally REISUB.

Is there a point waiting any longer ? A timeout / watchdog of any kind ?

When I switch the computer on, after logging with my user, before the desktop
displays (background, panels, etc.), I get some kind of broken mozaic of images
from my sessions before the failure (not images diplayed on frozen screen,
rather images from different pages of my browser that where open when it
occured).

It seems to happen randomly, so I can't reproduce systematically, but I think
it always happens when I'm watching a video (using vlc) and my brower is
running, maybe some other apps like mail-client, and it could be linked to a
specific user action (like moving window, or changing focus,...) because I
don't remember it happening while I'm just sitting away from the keyboard, like
watching a movie.

Today, instead of REISUBing, I went to another computer to access mine through
SSH. When I came back, lightdm was waiting for my user/pwd. Considering the
uptime and the dates of /var/log/Xorg.0.log.old, I guess Xorg was restarted.
When logging in, I didn't get the mozaic.

I doubt it is another bug, so maybe Xorg was restarted due to me waiting longer
than usual, or, more doubtedly, my remote logging. And I didn't get the mozaic
because nouveau's buffer were flushed more cleanly than with REISUB.

Anyway, I don't know much about graphics, so I can't make more guesses and I
can't tell whether this is a duplicate or not.

My system is an up-to-date Debian Jessie.

xserver-xorg-video-nouveau -&gt; 1:1.0.11-1
Linux 3.16.0-4-amd64 #1 SMP Debian 3.16.7-ckt11-1 (2015-05-24) x86_64 GNU/Linux

Attaching dmesg output (same now than when remotely logged in, nothing about
Xorg reboot or anything since the freeze).

Also attaching /var/log/Xorg.0.log.old.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1434190254.030C1.29377--

--===============0019310445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0019310445==--

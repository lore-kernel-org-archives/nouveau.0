From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90825] New: nouveau crashes on MacBookPro when
 VirtualBox hardware acceleration is used
Date: Tue, 02 Jun 2015 22:25:37 +0000
Message-ID: <bug-90825-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1967320177=="
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


--===============1967320177==
Content-Type: multipart/alternative; boundary="1433283937.dC83FcE0.24303"; charset="UTF-8"


--1433283937.dC83FcE0.24303
Date: Tue, 2 Jun 2015 22:25:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90825

            Bug ID: 90825
           Summary: nouveau crashes on MacBookPro when VirtualBox hardware
                    acceleration is used
           Product: Mesa
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: costan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

I can repro this consistently by installing Hearthstone on Windows 7, and
trying to run the game. The repro is rather bulky. FWIW, at least the bits can
be obtained gratis (Win7 has a trial, Hearthstone is free to play).

The kernel log is filled with these messages:

[ 1167.316496] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 11
[VBoxCrWinCmd[6069]] subc 0 mthd 0x000c data 0x20030298
[ 1167.316510] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: METHOD


The bug appears to be very similar to the following Ubuntu bug, which has more
debugging information:
https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1391086

Please let me know if I can supply extra information to help debug this.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1433283937.dC83FcE0.24303
Date: Tue, 2 Jun 2015 22:25:37 +0000
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
   title="NEW - nouveau crashes on MacBookPro when VirtualBox hardware acceleration is used"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90825">90825</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau crashes on MacBookPro when VirtualBox hardware acceleration is used
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>costan&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I can repro this consistently by installing Hearthstone on Windows 7, and
trying to run the game. The repro is rather bulky. FWIW, at least the bits can
be obtained gratis (Win7 has a trial, Hearthstone is free to play).

The kernel log is filled with these messages:

[ 1167.316496] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 11
[VBoxCrWinCmd[6069]] subc 0 mthd 0x000c data 0x20030298
[ 1167.316510] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: METHOD


The bug appears to be very similar to the following Ubuntu bug, which has more
debugging information:
<a href="https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1391086">https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1391086</a>

Please let me know if I can supply extra information to help debug this.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1433283937.dC83FcE0.24303--

--===============1967320177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1967320177==--

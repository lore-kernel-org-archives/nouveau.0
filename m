From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80507] Cannot set pwm1 above 80 on GeForce 9600 GT,
	10de:0622
Date: Wed, 25 Jun 2014 15:14:14 +0000
Message-ID: <bug-80507-8800-QAWGyn4hvP@http.bugs.freedesktop.org/>
References: <bug-80507-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0968770884=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80507-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0968770884==
Content-Type: multipart/alternative; boundary="1403709254.d5B52bD1.12125"; charset="us-ascii"


--1403709254.d5B52bD1.12125
Date: Wed, 25 Jun 2014 15:14:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80507

Adam Williamson <awilliam-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |NOTABUG

--- Comment #4 from Adam Williamson <awilliam-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> ---
Ben initially thought it was a bug as he thought he had a vbios from the same
card indicating it should go higher, but apparently he may have been looking at
the wrong one. pwm1_max is 80, yeah. apparently ideally I should send the vbios
to verify, but Fedora's kernel config doesn't seem to provide the necessary
bits...I only filed this as Ben thought it was a bug, so let's just close it
for now.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403709254.d5B52bD1.12125
Date: Wed, 25 Jun 2014 15:14:14 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:awilliam&#64;redhat.com" title="Adam Williamson &lt;awilliam&#64;redhat.com&gt;"> <span class="fn">Adam Williamson</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Cannot set pwm1 above 80 on GeForce 9600 GT, 10de:0622"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80507">bug 80507</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>NOTABUG
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Cannot set pwm1 above 80 on GeForce 9600 GT, 10de:0622"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80507#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Cannot set pwm1 above 80 on GeForce 9600 GT, 10de:0622"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80507">bug 80507</a>
              from <span class="vcard"><a class="email" href="mailto:awilliam&#64;redhat.com" title="Adam Williamson &lt;awilliam&#64;redhat.com&gt;"> <span class="fn">Adam Williamson</span></a>
</span></b>
        <pre>Ben initially thought it was a bug as he thought he had a vbios from the same
card indicating it should go higher, but apparently he may have been looking at
the wrong one. pwm1_max is 80, yeah. apparently ideally I should send the vbios
to verify, but Fedora's kernel config doesn't seem to provide the necessary
bits...I only filed this as Ben thought it was a bug, so let's just close it
for now.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403709254.d5B52bD1.12125--

--===============0968770884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0968770884==--

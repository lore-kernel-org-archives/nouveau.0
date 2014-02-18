From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75094] NV92 is faster and runs games fine than NVE6,
	why?
Date: Tue, 18 Feb 2014 04:59:22 +0000
Message-ID: <bug-75094-8800-kNi9VHpXKi@http.bugs.freedesktop.org/>
References: <bug-75094-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0441254597=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75094-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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


--===============0441254597==
Content-Type: multipart/alternative; boundary="1392699562.facC2D8c1.22887"; charset="us-ascii"


--1392699562.facC2D8c1.22887
Date: Tue, 18 Feb 2014 04:59:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75094

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |NOTABUG

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Asif, I understand your frustration. However this is due to the lack of
reclocking in nouveau. Kepler cards are, by default, usually clocked at ~50MHz,
while your 9800 probably runs at 1GHz+. Since we can't (currently, reliably)
change clocks, you end up running at that default frequency, and it's no
surprise that the Kepler card is slower when its clocks are 1/20th of the speed
of the 9800.

There _is_ highly experimental reclocking available, feel free to try it out,
but this is a "will void warranty" type situation :) You'll need to grab the
latest 3.14-rc, remove the "return -ENOSYS" in the pstate update handler, and
potentially boot with nouveau.config=NvMemExec=1 if you're feeling particularly
adventurous.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392699562.facC2D8c1.22887
Date: Tue, 18 Feb 2014 04:59:22 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - NV92 is faster and runs games fine than NVE6, why?"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75094">bug 75094</a>
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
   title="RESOLVED NOTABUG - NV92 is faster and runs games fine than NVE6, why?"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75094#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - NV92 is faster and runs games fine than NVE6, why?"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75094">bug 75094</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Asif, I understand your frustration. However this is due to the lack of
reclocking in nouveau. Kepler cards are, by default, usually clocked at ~50MHz,
while your 9800 probably runs at 1GHz+. Since we can't (currently, reliably)
change clocks, you end up running at that default frequency, and it's no
surprise that the Kepler card is slower when its clocks are 1/20th of the speed
of the 9800.

There _is_ highly experimental reclocking available, feel free to try it out,
but this is a &quot;will void warranty&quot; type situation :) You'll need to grab the
latest 3.14-rc, remove the &quot;return -ENOSYS&quot; in the pstate update handler, and
potentially boot with nouveau.config=NvMemExec=1 if you're feeling particularly
adventurous.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392699562.facC2D8c1.22887--

--===============0441254597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0441254597==--

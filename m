From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94342] New: Nvidia G96GLM 3840x2160@30 not
 functional with nouveau
Date: Mon, 29 Feb 2016 22:51:51 +0000
Message-ID: <bug-94342-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2112646409=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2112646409==
Content-Type: multipart/alternative; boundary="14567863190.A0Abd3.19788";
 charset="UTF-8"


--14567863190.A0Abd3.19788
Date: Mon, 29 Feb 2016 22:51:59 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94342

            Bug ID: 94342
           Summary: Nvidia G96GLM 3840x2160@30 not functional with nouveau
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

While my Nvidia G96GLM [Quadro FX 770M] yields 3840x2160@30 well under Windows
7 certain problems appear when trying to make use of that mode under
nouveau/Linux. The 3840x2160_23.00 mode described in Bug 93405 works well also
with the G96GLM; here even without any nouveau.hdmimhz parameter.
  A 3840x2160@30 mode appears automatically as soon as I specify
nouveau.hdmimhz=297. However when I select it the external monitor turns white
with a black bar at the bottom instead of showing the correct screen content.
Trying predefined modelines by cvt, gtf or the arachnoid modeline calculator
(online) does not yield any usable result either (blackscreens).
  Unfortunately many 4K screens only support at minimum 30Hz and not 23Hz so
that this issue is a real problem. Besides this heavy mode switching can still
lead to crashes/hangs while the 3840x2160@30-interlaced mode worked well even
without a hdmimhz parameter. However for interlaced modes the mouse pointer
still disappears.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14567863190.A0Abd3.19788
Date: Mon, 29 Feb 2016 22:51:59 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nvidia G96GLM 3840x2160&#64;30 not functional with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94342">94342</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nvidia G96GLM 3840x2160&#64;30 not functional with nouveau
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
          <td>estellnb&#64;elstel.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>While my Nvidia G96GLM [Quadro FX 770M] yields 3840x2160&#64;30 well under Windows
7 certain problems appear when trying to make use of that mode under
nouveau/Linux. The 3840x2160_23.00 mode described in <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - nouveau: Xorg crashes sooner or later in 3840x2160 mode"
   href="show_bug.cgi?id=93405">Bug 93405</a> works well also
with the G96GLM; here even without any nouveau.hdmimhz parameter.
  A 3840x2160&#64;30 mode appears automatically as soon as I specify
nouveau.hdmimhz=297. However when I select it the external monitor turns white
with a black bar at the bottom instead of showing the correct screen content.
Trying predefined modelines by cvt, gtf or the arachnoid modeline calculator
(online) does not yield any usable result either (blackscreens).
  Unfortunately many 4K screens only support at minimum 30Hz and not 23Hz so
that this issue is a real problem. Besides this heavy mode switching can still
lead to crashes/hangs while the 3840x2160&#64;30-interlaced mode worked well even
without a hdmimhz parameter. However for interlaced modes the mouse pointer
still disappears.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14567863190.A0Abd3.19788--

--===============2112646409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2112646409==--

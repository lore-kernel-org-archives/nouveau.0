From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94643] New: 4K Display on Displayport goes black
 when pointer hits column 0
Date: Mon, 21 Mar 2016 08:04:29 +0000
Message-ID: <bug-94643-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0810894088=="
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


--===============0810894088==
Content-Type: multipart/alternative; boundary="14585474691.cAcBB2.23817";
 charset="UTF-8"


--14585474691.cAcBB2.23817
Date: Mon, 21 Mar 2016 08:04:29 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94643

            Bug ID: 94643
           Summary: 4K Display on Displayport goes black when pointer hits
                    column 0
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: rmu-hikZAF2L1OleoWH0uzbU5w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I have a very strange problem with a recently purchased ViewSonic 4k display
connected via display port to a Thinkpad 410 with nvidia gt218m (nvs 3100m).

Every time the mouse pointer touches the left edge of the screen, the display
becomes a block of solid color and freezes. Suspend/resume of the laptop
reanimates the display.

versions: X server 1.17.2, linux kernel 4.5.0, nouveau 1.0.11 and 1.0.12, dual
screens active (also happens with external monitor active only, though that
configuration is very unstable), does not matter if the external monitor is
configured as "left", "right" or "top" to the internal; did not try "bottom".
System: ubuntu 14.04, linux kernel from mainline ppa, x-server & co is of
lts-wily variant.

with workaround: xbarrier 1 0 1 2160, so pointer can't go to column 0,
everything seems stable.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14585474691.cAcBB2.23817
Date: Mon, 21 Mar 2016 08:04:29 +0000
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
   title="NEW - 4K Display on Displayport goes black when pointer hits column 0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94643">94643</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>4K Display on Displayport goes black when pointer hits column 0
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
          <td>rmu&#64;unfoo.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I have a very strange problem with a recently purchased ViewSonic 4k display
connected via display port to a Thinkpad 410 with nvidia gt218m (nvs 3100m).

Every time the mouse pointer touches the left edge of the screen, the display
becomes a block of solid color and freezes. Suspend/resume of the laptop
reanimates the display.

versions: X server 1.17.2, linux kernel 4.5.0, nouveau 1.0.11 and 1.0.12, dual
screens active (also happens with external monitor active only, though that
configuration is very unstable), does not matter if the external monitor is
configured as &quot;left&quot;, &quot;right&quot; or &quot;top&quot; to the internal; did not try &quot;bottom&quot;.
System: ubuntu 14.04, linux kernel from mainline ppa, x-server &amp; co is of
lts-wily variant.

with workaround: xbarrier 1 0 1 2160, so pointer can't go to column 0,
everything seems stable.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14585474691.cAcBB2.23817--

--===============0810894088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0810894088==--

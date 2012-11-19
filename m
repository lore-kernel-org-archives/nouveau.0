From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57278] New: [xf86-video-nouveau] flightgear crash
 when loading scenary
Date: Mon, 19 Nov 2012 14:38:42 +0000
Message-ID: <bug-57278-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0764046987=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0764046987==
Content-Type: multipart/alternative; boundary="1353335922.D4Ce0.5153"; charset="us-ascii"


--1353335922.D4Ce0.5153
Date: Mon, 19 Nov 2012 14:38:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57278

          Priority: medium
            Bug ID: 57278
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [xf86-video-nouveau] flightgear crash when loading
                    scenary
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: king.infet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Drivers/DRI/nouveau
           Product: Mesa

Description:
run flightgear and crash

Additional info:
* package version(s) = 2.8.0

LOG:

KI266 dme indicator #0 initialized
loading scenario 'nimitz_demo'
PNG lib warning : Interlace handling should be turned on when using
png_read_image
PNG lib warning : Interlace handling should be turned on when using
png_read_image
Initializing Nasal Electrical System
join_values_nofail:398 - failed to coalesce values
join_values_nofail:398 - failed to coalesce values
fgfs: nv50_pc.h:351: nv_alloc_instruction: Assertion `pc->num_instructions <
2048' failed.
Aborted

Steps to reproduce:

1)install
2) run
3) loading scenery
4) CRASH

SEE view: https://bugs.archlinux.org/task/31362

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1353335922.D4Ce0.5153
Date: Mon, 19 Nov 2012 14:38:42 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [xf86-video-nouveau] flightgear crash when loading scenary"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57278">57278</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[xf86-video-nouveau] flightgear crash when loading scenary
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>king.infet&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Description:
run flightgear and crash

Additional info:
* package version(s) = 2.8.0

LOG:

KI266 dme indicator #0 initialized
loading scenario 'nimitz_demo'
PNG lib warning : Interlace handling should be turned on when using
png_read_image
PNG lib warning : Interlace handling should be turned on when using
png_read_image
Initializing Nasal Electrical System
join_values_nofail:398 - failed to coalesce values
join_values_nofail:398 - failed to coalesce values
fgfs: nv50_pc.h:351: nv_alloc_instruction: Assertion `pc-&gt;num_instructions &lt;
2048' failed.
Aborted

Steps to reproduce:

1)install
2) run
3) loading scenery
4) CRASH

SEE view: <a href="https://bugs.archlinux.org/task/31362">https://bugs.archlinux.org/task/31362</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1353335922.D4Ce0.5153--

--===============0764046987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0764046987==--

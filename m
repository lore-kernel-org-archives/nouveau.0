From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95334] New: GM107 with 2560x1440 display on HDMI
 selects suboptimal resolution 1920x1080
Date: Tue, 10 May 2016 08:07:55 +0000
Message-ID: <bug-95334-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0638476963=="
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


--===============0638476963==
Content-Type: multipart/alternative; boundary="14628676751.d2607e0B.1542";
 charset="UTF-8"


--14628676751.d2607e0B.1542
Date: Tue, 10 May 2016 08:07:55 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95334

            Bug ID: 95334
           Summary: GM107 with 2560x1440 display on HDMI selects
                    suboptimal resolution 1920x1080
           Product: xorg
           Version: 7.7 (2012.06)
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: bugs.freedesktop.org-owGEuczhWdsicLL2Nvhyww@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Display is a Crossover 2720MDP (cheap South Korean QHD screen). I don't think
this ever worked right with nouveau since when I bought it in March 2013. The
correct full resolution is not available in Ubuntu's System Settings section
'Displays'. It works fine with the nvidia driver (and under Windows). 

$ lspci | grep VGA
01:00.0 VGA compatible controller: NVIDIA Corporation GM107 [GeForce GTX 750
Ti] (rev a2)

Will attach logs later on.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14628676751.d2607e0B.1542
Date: Tue, 10 May 2016 08:07:55 +0000
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
   title="NEW - GM107 with 2560x1440 display on HDMI selects suboptimal resolution 1920x1080"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95334">95334</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GM107 with 2560x1440 display on HDMI selects suboptimal resolution 1920x1080
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2012.06)
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
          <td>bugs.freedesktop.org&#64;hpoley.dds.nl
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Display is a Crossover 2720MDP (cheap South Korean QHD screen). I don't think
this ever worked right with nouveau since when I bought it in March 2013. The
correct full resolution is not available in Ubuntu's System Settings section
'Displays'. It works fine with the nvidia driver (and under Windows). 

$ lspci | grep VGA
01:00.0 VGA compatible controller: NVIDIA Corporation GM107 [GeForce GTX 750
Ti] (rev a2)

Will attach logs later on.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14628676751.d2607e0B.1542--

--===============0638476963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0638476963==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94757] New: powerpc64 & 64Kb kernel pagesize not
 working with nouveau
Date: Wed, 30 Mar 2016 09:31:10 +0000
Message-ID: <bug-94757-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1356291281=="
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


--===============1356291281==
Content-Type: multipart/alternative; boundary="14593302701.Ebf5EA4fF.12195";
 charset="UTF-8"


--14593302701.Ebf5EA4fF.12195
Date: Wed, 30 Mar 2016 09:31:10 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94757

            Bug ID: 94757
           Summary: powerpc64 & 64Kb kernel pagesize not working with
                    nouveau
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mathieu.malaterre-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

The recent Debian kernels for powerpc64 are configured with a 64Kb kernel
pagesize.
This works slightly better in terms of performance, however the nouveau display
driver does not currently work kernel pagesizes other than 4Kb size when
running XOrg and powerpc64. It works ok if only using the console though.

Currently, users must recompile the kernel unfortunately and configure with 4Kb
kernel pagesize as this is what nouveau will only work with for now.
This is a hindrance to making people want to adopt debian as their preffered
linux distro with powerpc64 G5 powermac machines.

Im currently running vanilla 3.18.16 configured with 4Kb and nouveau can be
made to work without too many dramas.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14593302701.Ebf5EA4fF.12195
Date: Wed, 30 Mar 2016 09:31:10 +0000
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
   title="NEW - powerpc64 &amp; 64Kb kernel pagesize not working with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94757">94757</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>powerpc64 &amp; 64Kb kernel pagesize not working with nouveau
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
          <td>mathieu.malaterre&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>The recent Debian kernels for powerpc64 are configured with a 64Kb kernel
pagesize.
This works slightly better in terms of performance, however the nouveau display
driver does not currently work kernel pagesizes other than 4Kb size when
running XOrg and powerpc64. It works ok if only using the console though.

Currently, users must recompile the kernel unfortunately and configure with 4Kb
kernel pagesize as this is what nouveau will only work with for now.
This is a hindrance to making people want to adopt debian as their preffered
linux distro with powerpc64 G5 powermac machines.

Im currently running vanilla 3.18.16 configured with 4Kb and nouveau can be
made to work without too many dramas.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14593302701.Ebf5EA4fF.12195--

--===============1356291281==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1356291281==--

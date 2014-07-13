From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81283] New: Icons are misrendered when rgb font
 hinting is activated [NV18]
Date: Sun, 13 Jul 2014 08:15:20 +0000
Message-ID: <bug-81283-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0806243870=="
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


--===============0806243870==
Content-Type: multipart/alternative; boundary="1405239320.575dcd1.17581"; charset="us-ascii"


--1405239320.575dcd1.17581
Date: Sun, 13 Jul 2014 08:15:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81283

          Priority: medium
            Bug ID: 81283
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Icons are misrendered when rgb font hinting is
                    activated [NV18]
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 102687
  --> https://bugs.freedesktop.org/attachment.cgi?id=102687&action=edit
xorg.log

When selecting RGB subpixel font antialising on my mothers laptop (Geforce
488Go / NV18) icons are suddenly misrendered (see screenshot)

Tried several options such as NoUploadTo/DowloadFromScreen, MigrationHeuristics
smart/greedy, agpmode=0 - however only disabling render acceleration completely
did help.

The notebook is running Fedora-20 + latest updates (linux-3.15.4), the issue
happends with nouveau 1.0.9 as well as nouveau git from 20140713.

- Clemens

PS: It is incredible how well nouveau performs for 2D operations these days,
thanks for working on improving this area over the past years.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1405239320.575dcd1.17581
Date: Sun, 13 Jul 2014 08:15:20 +0000
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
   title="NEW --- - Icons are misrendered when rgb font hinting is activated [NV18]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81283">81283</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Icons are misrendered when rgb font hinting is activated [NV18]
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
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
          <td>linuxhippy&#64;gmail.com
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
          <td>git
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=102687" name="attach_102687" title="xorg.log">attachment 102687</a> <a href="attachment.cgi?id=102687&amp;action=edit" title="xorg.log">[details]</a></span>
xorg.log

When selecting RGB subpixel font antialising on my mothers laptop (Geforce
488Go / NV18) icons are suddenly misrendered (see screenshot)

Tried several options such as NoUploadTo/DowloadFromScreen, MigrationHeuristics
smart/greedy, agpmode=0 - however only disabling render acceleration completely
did help.

The notebook is running Fedora-20 + latest updates (linux-3.15.4), the issue
happends with nouveau 1.0.9 as well as nouveau git from 20140713.

- Clemens

PS: It is incredible how well nouveau performs for 2D operations these days,
thanks for working on improving this area over the past years.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1405239320.575dcd1.17581--

--===============0806243870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0806243870==--

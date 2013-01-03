From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58984] New: DRM NOUVEAU: probe of 0001:01:00.0
 failed with error -12
Date: Thu, 03 Jan 2013 14:26:00 +0000
Message-ID: <bug-58984-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1660386459=="
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


--===============1660386459==
Content-Type: multipart/alternative; boundary="1357223161.3Ea20AE1.19262"; charset="us-ascii"


--1357223161.3Ea20AE1.19262
Date: Thu, 3 Jan 2013 14:26:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58984

          Priority: medium
            Bug ID: 58984
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: DRM NOUVEAU: probe of 0001:01:00.0 failed with error
                    -12
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: SPARC
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

When booting a Sun Blade 2500 with a GeForce 8400 GS PCI, everything appears
pretty normal but for no apparent reason, the probe fails. It looks like error
-12 is "out of memory", but bug 56721 which looks similar does not apply. My
machine also has 6GB of memory, so I'm sure it isn't actually failing to
allocate system memory.

Running Linux 3.8-rc1 git and nouveau git from last night (Jan 2 2013).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1357223161.3Ea20AE1.19262
Date: Thu, 3 Jan 2013 14:26:01 +0000
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
   title="NEW --- - DRM NOUVEAU: probe of 0001:01:00.0 failed with error -12"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58984">58984</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>DRM NOUVEAU: probe of 0001:01:00.0 failed with error -12
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
          <td>baggett.patrick&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>SPARC
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
        <pre>When booting a Sun Blade 2500 with a GeForce 8400 GS PCI, everything appears
pretty normal but for no apparent reason, the probe fails. It looks like error
-12 is &quot;out of memory&quot;, but <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau driver fails on nv40 with error -12 (out of memory)"
   href="show_bug.cgi?id=56721">bug 56721</a> which looks similar does not apply. My
machine also has 6GB of memory, so I'm sure it isn't actually failing to
allocate system memory.

Running Linux 3.8-rc1 git and nouveau git from last night (Jan 2 2013).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1357223161.3Ea20AE1.19262--

--===============1660386459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1660386459==--

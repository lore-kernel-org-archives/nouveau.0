From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82527] New: xset dpms force {off, standby,
 suspend} returns after ~20 seconds (GeForce 8400 GS)
Date: Tue, 12 Aug 2014 20:47:21 +0000
Message-ID: <bug-82527-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0733716121=="
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


--===============0733716121==
Content-Type: multipart/alternative; boundary="1407876441.b8EE748d1.18627"; charset="us-ascii"


--1407876441.b8EE748d1.18627
Date: Tue, 12 Aug 2014 20:47:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82527

          Priority: medium
            Bug ID: 82527
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: xset dpms force {off,standby,suspend} returns after
                    ~20 seconds (GeForce 8400 GS)
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: martin-hvkNLsi7f8w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

With nouveau drivers (current versions: kernel 3.15.9,
xf86-video-nouveau-1.0.10, xorg-server-1.15.0; however the issue exists since
several years)
"xset dpms force off" (or standby/suspend) does not work here as it should:

In all three cases, the monitor switches off for about 20 seconds but then
switches on again.

The issue is completely reproducible and does not occur with the proprietary
nvidia-drivers.

I am rather sure that nothing (except perhaps nouveau drivers themselves)
causes any activity which might cancel the effect of "xset dpms force off":
This is already proved by the fact that it works with the proprietary
nvidia-drivers, but I also checked many times that no suspectible task is
running (and besides systemd the bug has occured also with openrc and with a
minimal number of started services).

As mentioned, the problem exists since several years, so I do not think that
any of the recent changes referred to in bug 76483 is related to this.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1407876441.b8EE748d1.18627
Date: Tue, 12 Aug 2014 20:47:21 +0000
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
   title="NEW --- - xset dpms force {off,standby,suspend} returns after ~20 seconds (GeForce 8400 GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82527">82527</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>xset dpms force {off,standby,suspend} returns after ~20 seconds (GeForce 8400 GS)
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
          <td>martin&#64;mvath.de
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
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
        <pre>With nouveau drivers (current versions: kernel 3.15.9,
xf86-video-nouveau-1.0.10, xorg-server-1.15.0; however the issue exists since
several years)
&quot;xset dpms force off&quot; (or standby/suspend) does not work here as it should:

In all three cases, the monitor switches off for about 20 seconds but then
switches on again.

The issue is completely reproducible and does not occur with the proprietary
nvidia-drivers.

I am rather sure that nothing (except perhaps nouveau drivers themselves)
causes any activity which might cancel the effect of &quot;xset dpms force off&quot;:
This is already proved by the fact that it works with the proprietary
nvidia-drivers, but I also checked many times that no suspectible task is
running (and besides systemd the bug has occured also with openrc and with a
minimal number of started services).

As mentioned, the problem exists since several years, so I do not think that
any of the recent changes referred to in <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50, bisected, RFC patch] xset dpms force {on,off} does not work over DP"
   href="show_bug.cgi?id=76483">bug 76483</a> is related to this.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1407876441.b8EE748d1.18627--

--===============0733716121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0733716121==--

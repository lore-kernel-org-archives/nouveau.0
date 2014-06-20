From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80300] New: [NVE7] Fails to suspend on 3.15
Date: Fri, 20 Jun 2014 18:20:13 +0000
Message-ID: <bug-80300-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0492972846=="
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


--===============0492972846==
Content-Type: multipart/alternative; boundary="1403288413.bBe6a61.3136"; charset="us-ascii"


--1403288413.bBe6a61.3136
Date: Fri, 20 Jun 2014 18:20:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80300

          Priority: medium
            Bug ID: 80300
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVE7] Fails to suspend on 3.15
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: e.swanson+xorgbugs-5lA2vZBjcqn3oGB3hsPCZA@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

After upgrading to:
Linux svoboda 3.15.1-1-ARCH #1 SMP PREEMPT Tue Jun 17 09:32:20 CEST 2014 x86_64
GNU/Linux

nouveau fails to suspend. The interesting dmesg lines are:
[ 1408.108662] nouveau E[   PDISP][0000:01:00.0][0xc000917c][ffff8804261aab80]
fini: 0xc2071088
[ 1408.108663] nouveau E[   PDISP][0000:01:00.0][0xc000917c][ffff8804261aab80]
failed suspend, -16

I have one output connected, an active DisplayPort -> DVI adapter to drive my
27" 2560x1440 monitor.

The card is a Quadro K2000M (NVE7 GK107).

When I was on linux 3.14 using this adapter, suspend worked, but it would fail
during resume - my display would not come back up, but restarting X would fix
it. Unfortunately, I never captured the dmesg from that. The following two
lines were present, however.

[54004.956815] nouveau E[   PDISP][0000:01:00.0] DP:0006:0f42: failed to read
DPCD
[54004.958586] nouveau E[   PDISP][0000:01:00.0] DP:0006:0f42: link training
failed

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403288413.bBe6a61.3136
Date: Fri, 20 Jun 2014 18:20:13 +0000
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
   title="NEW --- - [NVE7] Fails to suspend on 3.15"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80300">80300</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE7] Fails to suspend on 3.15
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
          <td>e.swanson+xorgbugs&#64;alloscomp.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
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
        <pre>After upgrading to:
Linux svoboda 3.15.1-1-ARCH #1 SMP PREEMPT Tue Jun 17 09:32:20 CEST 2014 x86_64
GNU/Linux

nouveau fails to suspend. The interesting dmesg lines are:
[ 1408.108662] nouveau E[   PDISP][0000:01:00.0][0xc000917c][ffff8804261aab80]
fini: 0xc2071088
[ 1408.108663] nouveau E[   PDISP][0000:01:00.0][0xc000917c][ffff8804261aab80]
failed suspend, -16

I have one output connected, an active DisplayPort -&gt; DVI adapter to drive my
27&quot; 2560x1440 monitor.

The card is a Quadro K2000M (NVE7 GK107).

When I was on linux 3.14 using this adapter, suspend worked, but it would fail
during resume - my display would not come back up, but restarting X would fix
it. Unfortunately, I never captured the dmesg from that. The following two
lines were present, however.

[54004.956815] nouveau E[   PDISP][0000:01:00.0] DP:0006:0f42: failed to read
DPCD
[54004.958586] nouveau E[   PDISP][0000:01:00.0] DP:0006:0f42: link training
failed</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403288413.bBe6a61.3136--

--===============0492972846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0492972846==--

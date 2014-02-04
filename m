From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74485] New: [NVE6] system hangs with 3D applications
Date: Tue, 04 Feb 2014 03:23:52 +0000
Message-ID: <bug-74485-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0475250618=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0475250618==
Content-Type: multipart/alternative; boundary="1391484232.4Fb340.5762"; charset="us-ascii"


--1391484232.4Fb340.5762
Date: Tue, 4 Feb 2014 03:23:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74485

          Priority: medium
            Bug ID: 74485
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVE6] system hangs with 3D applications
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: prg-uDMUqRiVvSc@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 93330
  --> https://bugs.freedesktop.org/attachment.cgi?id=93330&action=edit
dmesg of the hang

Kernel 3.13.1, mesa git from 2014-02-01 (10.1.0-devel (git-dc00ec1))
Non-composited KDE desktop

System randomly hangs when using 3D applications, tried with Half Life 2,
Dota2, some older games with wine. The hang might happen right when entering
the game or maybe after a few minutes of playing. Just running glxgears works
for quite some time (>35min).

Bug #72180 suggests that using blob fw fixes random lockups, but it doesn't
help in my case. Frequency of hangs seems to be about the same with and without
blob fw.

Bug #63165 reports display corruption which i haven't seen yet and has quite
different error messages in the logs.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391484232.4Fb340.5762
Date: Tue, 4 Feb 2014 03:23:52 +0000
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
   title="NEW --- - [NVE6] system hangs with 3D applications"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74485">74485</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE6] system hangs with 3D applications
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
          <td>prg&#64;cooco.de
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
          <td>git
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
        <pre>Created <span class=""><a href="attachment.cgi?id=93330" name="attach_93330" title="dmesg of the hang">attachment 93330</a> <a href="attachment.cgi?id=93330&amp;action=edit" title="dmesg of the hang">[details]</a></span>
dmesg of the hang

Kernel 3.13.1, mesa git from 2014-02-01 (10.1.0-devel (git-dc00ec1))
Non-composited KDE desktop

System randomly hangs when using 3D applications, tried with Half Life 2,
Dota2, some older games with wine. The hang might happen right when entering
the game or maybe after a few minutes of playing. Just running glxgears works
for quite some time (&gt;35min).

<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] Random GPU Lockups, works with blob PGRAPH fw"
   href="show_bug.cgi?id=72180">Bug #72180</a> suggests that using blob fw fixes random lockups, but it doesn't
help in my case. Frequency of hangs seems to be about the same with and without
blob fw.

<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] GTX660 GPU lockups on 3D applications"
   href="show_bug.cgi?id=63165">Bug #63165</a> reports display corruption which i haven't seen yet and has quite
different error messages in the logs.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391484232.4Fb340.5762--

--===============0475250618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0475250618==--

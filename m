From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82726] New: [NV96][NVAC] [Regression] [Bisected]
 Probe failed with error -12
Date: Sun, 17 Aug 2014 11:18:50 +0000
Message-ID: <bug-82726-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1348420168=="
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


--===============1348420168==
Content-Type: multipart/alternative; boundary="1408274330.27ac0B731.24459"; charset="us-ascii"


--1408274330.27ac0B731.24459
Date: Sun, 17 Aug 2014 11:18:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82726

          Priority: medium
            Bug ID: 82726
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV96][NVAC] [Regression] [Bisected] Probe failed with
                    error -12
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: blocker
    Classification: Unclassified
                OS: Linux (All)
          Reporter: pierre.morrow-GANU6spQydw@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 104756
  --> https://bugs.freedesktop.org/attachment.cgi?id=104756&action=edit
Dmesg with probe fail on NVAC and NV96

Linux version: 3.16.0
Nouveau version: commit 263d1d2 from darktama's tree
Cards: 9400M (NVAC)
       9600M GT (NV96)

First bad commit is:

    commit a6924b68dac60d1f991c7ff63bc061aeac85ac3e
    Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
    Date:   Mon Aug 11 12:23:23 2014 +1000

        bar: ioremap only the areas that we're actually using

        Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Starting with this commit, Nouveau probe fails with -ENOMEM. I did some
testing, and this error isn't returned by nouveau_barobj_ctor, nor by
nouveau_bar_alloc.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408274330.27ac0B731.24459
Date: Sun, 17 Aug 2014 11:18:50 +0000
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
   title="NEW --- - [NV96][NVAC] [Regression] [Bisected] Probe failed with error -12"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82726">82726</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV96][NVAC] [Regression] [Bisected] Probe failed with error -12
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>blocker
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
          <td>pierre.morrow&#64;free.fr
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
        <pre>Created <span class=""><a href="attachment.cgi?id=104756" name="attach_104756" title="Dmesg with probe fail on NVAC and NV96">attachment 104756</a> <a href="attachment.cgi?id=104756&amp;action=edit" title="Dmesg with probe fail on NVAC and NV96">[details]</a></span>
Dmesg with probe fail on NVAC and NV96

Linux version: 3.16.0
Nouveau version: commit 263d1d2 from darktama's tree
Cards: 9400M (NVAC)
       9600M GT (NV96)

First bad commit is:

    commit a6924b68dac60d1f991c7ff63bc061aeac85ac3e
    Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
    Date:   Mon Aug 11 12:23:23 2014 +1000

        bar: ioremap only the areas that we're actually using

        Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;

Starting with this commit, Nouveau probe fails with -ENOMEM. I did some
testing, and this error isn't returned by nouveau_barobj_ctor, nor by
nouveau_bar_alloc.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408274330.27ac0B731.24459--

--===============1348420168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1348420168==--

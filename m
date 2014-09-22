From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84203] New: HDMI gives no more signal
Date: Mon, 22 Sep 2014 22:40:48 +0000
Message-ID: <bug-84203-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0266084989=="
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


--===============0266084989==
Content-Type: multipart/alternative; boundary="1411425648.0fDdb54E1.3977"; charset="us-ascii"


--1411425648.0fDdb54E1.3977
Date: Mon, 22 Sep 2014 22:40:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84203

          Priority: medium
            Bug ID: 84203
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: HDMI gives no more signal
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: jean-louis-h84OYfGOAs2zQB+pC5nmwQ@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

This week I tried HDMI again on my system, and noticed it was completely
broken.
Got just no signal on my screen.

I knew it was working some months (and upgrades) ago.
After testing I found out the issue was introduced between kernel v3.14 and
v3.15.

Situation:
Insert HDMI cable into my laptop, and no signal on the external display.

The dmesg fills with errors also:
[  186.210622] nouveau E[   PDISP][0000:01:00.0] INVALID_STATE [UNK08] chid 0
mthd 0x0080 data 0x00000000
[  186.210627] nouveau E[   PDISP][0000:01:00.0] Core:
[  186.210634] nouveau E[   PDISP][0000:01:00.0]     0x0084: 0x5dc34da1 ->
0x80000000
[  186.210640] nouveau E[   PDISP][0000:01:00.0]     0x0088: 0x00000000         

etc.

After some git bisect playtime, I found out the following commit caused the
issue:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/nouveau?id=05c63c2ff23a80b654d6c088ac3ba21628db0173

So I went back to stable 3.16 (Ubuntu Utopic version), and did a git revert for
that commit.
And yep, HDMI output was working again, and no more nouveau errors in dmesg.


My device:
[   30.823267] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0c1a00a1
[   30.823269] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF108 (NVC1)
[   30.823270] nouveau  [  DEVICE][0000:01:00.0] Family : NVC0

Laptop dell xps 15 l502x

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1411425648.0fDdb54E1.3977
Date: Mon, 22 Sep 2014 22:40:48 +0000
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
   title="NEW --- - HDMI gives no more signal"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84203">84203</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>HDMI gives no more signal
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
          <td>jean-louis&#64;dupond.be
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
        <pre>This week I tried HDMI again on my system, and noticed it was completely
broken.
Got just no signal on my screen.

I knew it was working some months (and upgrades) ago.
After testing I found out the issue was introduced between kernel v3.14 and
v3.15.

Situation:
Insert HDMI cable into my laptop, and no signal on the external display.

The dmesg fills with errors also:
[  186.210622] nouveau E[   PDISP][0000:01:00.0] INVALID_STATE [UNK08] chid 0
mthd 0x0080 data 0x00000000
[  186.210627] nouveau E[   PDISP][0000:01:00.0] Core:
[  186.210634] nouveau E[   PDISP][0000:01:00.0]     0x0084: 0x5dc34da1 -&gt;
0x80000000
[  186.210640] nouveau E[   PDISP][0000:01:00.0]     0x0088: 0x00000000         

etc.

After some git bisect playtime, I found out the following commit caused the
issue:
<a href="https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/nouveau?id=05c63c2ff23a80b654d6c088ac3ba21628db0173">https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/nouveau?id=05c63c2ff23a80b654d6c088ac3ba21628db0173</a>

So I went back to stable 3.16 (Ubuntu Utopic version), and did a git revert for
that commit.
And yep, HDMI output was working again, and no more nouveau errors in dmesg.


My device:
[   30.823267] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0c1a00a1
[   30.823269] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF108 (NVC1)
[   30.823270] nouveau  [  DEVICE][0000:01:00.0] Family : NVC0

Laptop dell xps 15 l502x</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1411425648.0fDdb54E1.3977--

--===============0266084989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0266084989==--

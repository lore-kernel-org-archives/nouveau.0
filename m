From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57777] New: lcd screen of a laptop does not wake up
	after sleep
Date: Sat, 01 Dec 2012 15:59:56 +0000
Message-ID: <bug-57777-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0811477336=="
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


--===============0811477336==
Content-Type: multipart/alternative; boundary="1354377596.8fEE1.27824"; charset="us-ascii"


--1354377596.8fEE1.27824
Date: Sat, 1 Dec 2012 15:59:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57777

          Priority: medium
            Bug ID: 57777
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: lcd screen of a laptop does not wake up after sleep
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: alinm.elena-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: 7.6 (2010.12)
         Component: Driver/nouveau
           Product: xorg

Created attachment 70883
  --> https://bugs.freedesktop.org/attachment.cgi?id=70883&action=edit
dmesg log

the lcd screen of the laptop remains off after resume... the external display
comes on as expected...
Linux abbaton.ucd.ie 3.7.0-rc6-5-desktop #1 SMP PREEMPT Tue Nov 27 14:10:39 UTC
2012 (f8c5dde) x86_64 x86_64 x86_64 GNU/Linux


I have attached the dmesg log.


other funny things...
*if I start only with the lcd... kde would not start just freeze before plasma
being loaded ( probably another bug to be reported.)
* I have a last good commit and first bad commit from an older version of the
nouveau git
last good
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=f4a75d2eb7b1e2206094b901be09adb31ba63681
first bad
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=9677f3d63de8f87d8e18a5509c8b18eed468e379

I was trying to bisect but because of the 3.7 rebase I am lost... sorry

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1354377596.8fEE1.27824
Date: Sat, 1 Dec 2012 15:59:56 +0000
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
   title="NEW --- - lcd screen of a laptop does not wake up after sleep"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57777">57777</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>lcd screen of a laptop does not wake up after sleep
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
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>alinm.elena&#64;gmail.com
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
          <td>7.6 (2010.12)
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
        <pre>Created <span class=""><a href="attachment.cgi?id=70883" name="attach_70883" title="dmesg log">attachment 70883</a> <a href="attachment.cgi?id=70883&amp;action=edit" title="dmesg log">[details]</a></span>
dmesg log

the lcd screen of the laptop remains off after resume... the external display
comes on as expected...
Linux abbaton.ucd.ie 3.7.0-rc6-5-desktop #1 SMP PREEMPT Tue Nov 27 14:10:39 UTC
2012 (f8c5dde) x86_64 x86_64 x86_64 GNU/Linux


I have attached the dmesg log.


other funny things...
*if I start only with the lcd... kde would not start just freeze before plasma
being loaded ( probably another bug to be reported.)
* I have a last good commit and first bad commit from an older version of the
nouveau git
last good
<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=f4a75d2eb7b1e2206094b901be09adb31ba63681">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=f4a75d2eb7b1e2206094b901be09adb31ba63681</a>
first bad
<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=9677f3d63de8f87d8e18a5509c8b18eed468e379">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=9677f3d63de8f87d8e18a5509c8b18eed468e379</a>

I was trying to bisect but because of the 3.7 rebase I am lost... sorry</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1354377596.8fEE1.27824--

--===============0811477336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0811477336==--

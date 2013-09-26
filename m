From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69830] New: Kernel 3.11 and newer hang at X11 start
 with NVIDIA GeForce GT 430
Date: Thu, 26 Sep 2013 02:58:01 +0000
Message-ID: <bug-69830-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1333351539=="
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


--===============1333351539==
Content-Type: multipart/alternative; boundary="1380164281.B85BCd0.10414"; charset="us-ascii"


--1380164281.B85BCd0.10414
Date: Thu, 26 Sep 2013 02:58:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69830

          Priority: medium
            Bug ID: 69830
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Kernel 3.11 and newer hang at X11 start with NVIDIA
                    GeForce GT 430
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 86607
  --> https://bugs.freedesktop.org/attachment.cgi?id=86607&action=edit
Xorg log

After updating from Linux kernel 3.9 to 3.12-rc2, X would no longer start. I
bisected the problem (starting at 4a10c2ac2f368583138b774ca41fac4207911983)
down to commit 30f4e0870d1726f31aa59804337cfd5e0a3f2ec7.

The bisect went like this:

a0fd4ec8f1ac1d966d33d1a18205b72830f9b24f - good
8ff860564076f99aeb4f6d35dcb6ea008624e64e - bad
d005f51eb93d71cd40ebd11dd377453fa8c8a42a - bad
56fbd2b65446d4fb4df7770c49a70d563b7569c9 - bad
791dc143ed2c441f5202d8721609d94dce9fcf88 - good
5ee86c4190f9e19a9e13906389069c73d7f75bfb - weird lines on top (called bad)
c03ff9e8fa5fc0186158b99a89f613325ff352cf - blank screen then monitor off
(called bad)
30f4e0870d1726f31aa59804337cfd5e0a3f2ec7 - bad

The two commits above with comments (5ee and c03) didn't make it all the way to
X11 (they hung before X11 was started, or so it seemed), but git bisect
reported at the end that 30f4e0870d1726f31aa59804337cfd5e0a3f2ec7 was the first
bad commit (and 5ee and c03 are both after 30f4e (the first bad one)).

Logs for a bad run are attached.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380164281.B85BCd0.10414
Date: Thu, 26 Sep 2013 02:58:01 +0000
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
   title="NEW --- - Kernel 3.11 and newer hang at X11 start with NVIDIA GeForce GT 430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69830">69830</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Kernel 3.11 and newer hang at X11 start with NVIDIA GeForce GT 430
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
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
          <td>alan&#64;signal11.us
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
        <pre>Created <span class=""><a href="attachment.cgi?id=86607" name="attach_86607" title="Xorg log">attachment 86607</a> <a href="attachment.cgi?id=86607&amp;action=edit" title="Xorg log">[details]</a></span>
Xorg log

After updating from Linux kernel 3.9 to 3.12-rc2, X would no longer start. I
bisected the problem (starting at 4a10c2ac2f368583138b774ca41fac4207911983)
down to commit 30f4e0870d1726f31aa59804337cfd5e0a3f2ec7.

The bisect went like this:

a0fd4ec8f1ac1d966d33d1a18205b72830f9b24f - good
8ff860564076f99aeb4f6d35dcb6ea008624e64e - bad
d005f51eb93d71cd40ebd11dd377453fa8c8a42a - bad
56fbd2b65446d4fb4df7770c49a70d563b7569c9 - bad
791dc143ed2c441f5202d8721609d94dce9fcf88 - good
5ee86c4190f9e19a9e13906389069c73d7f75bfb - weird lines on top (called bad)
c03ff9e8fa5fc0186158b99a89f613325ff352cf - blank screen then monitor off
(called bad)
30f4e0870d1726f31aa59804337cfd5e0a3f2ec7 - bad

The two commits above with comments (5ee and c03) didn't make it all the way to
X11 (they hung before X11 was started, or so it seemed), but git bisect
reported at the end that 30f4e0870d1726f31aa59804337cfd5e0a3f2ec7 was the first
bad commit (and 5ee and c03 are both after 30f4e (the first bad one)).

Logs for a bad run are attached.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380164281.B85BCd0.10414--

--===============1333351539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1333351539==--

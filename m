From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79795] New: [NVD9] No devices detected
Date: Sun, 08 Jun 2014 13:57:21 +0000
Message-ID: <bug-79795-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0773501004=="
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


--===============0773501004==
Content-Type: multipart/alternative; boundary="1402235841.fEc7eD341.16901"; charset="us-ascii"


--1402235841.fEc7eD341.16901
Date: Sun, 8 Jun 2014 13:57:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79795

          Priority: medium
            Bug ID: 79795
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVD9] No devices detected
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: mail-aHlQgkfGvMcb1SvskN2V4Q@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 100656
  --> https://bugs.freedesktop.org/attachment.cgi?id=100656&action=edit
Xorg.log

I get the message "No devices detected" in Xorg.log if I try to use my PciE
GeForce GT 610.

The device seems to be initialized correctly in the kernel module but Xorg
refuses to use it.


output from lspci | grep VGA:

01:00.0 VGA compatible controller: NVIDIA Corporation G96 [GeForce 9500 GT]
(rev a1)
06:00.0 VGA compatible controller: NVIDIA Corporation GF119 [GeForce GT 610]
(rev a1)


The other graphics card is my main graphics card. If I configure both cars in
xorg.conf only the main card is used. If I only configure the GT 610, nothing
is displayed.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402235841.fEc7eD341.16901
Date: Sun, 8 Jun 2014 13:57:21 +0000
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
   title="NEW --- - [NVD9] No devices detected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79795">79795</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVD9] No devices detected
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
          <td>mail&#64;tcrueger.de
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
        <pre>Created <span class=""><a href="attachment.cgi?id=100656" name="attach_100656" title="Xorg.log">attachment 100656</a> <a href="attachment.cgi?id=100656&amp;action=edit" title="Xorg.log">[details]</a></span>
Xorg.log

I get the message &quot;No devices detected&quot; in Xorg.log if I try to use my PciE
GeForce GT 610.

The device seems to be initialized correctly in the kernel module but Xorg
refuses to use it.


output from lspci | grep VGA:

01:00.0 VGA compatible controller: NVIDIA Corporation G96 [GeForce 9500 GT]
(rev a1)
06:00.0 VGA compatible controller: NVIDIA Corporation GF119 [GeForce GT 610]
(rev a1)


The other graphics card is my main graphics card. If I configure both cars in
xorg.conf only the main card is used. If I only configure the GT 610, nothing
is displayed.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402235841.fEc7eD341.16901--

--===============0773501004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0773501004==--

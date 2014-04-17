From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77574] New: Minor screen corruption on NVAF card
Date: Thu, 17 Apr 2014 13:54:42 +0000
Message-ID: <bug-77574-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0617458381=="
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


--===============0617458381==
Content-Type: multipart/alternative; boundary="1397742882.1B2FaEA1.2292"; charset="us-ascii"


--1397742882.1B2FaEA1.2292
Date: Thu, 17 Apr 2014 13:54:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77574

          Priority: medium
            Bug ID: 77574
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Minor screen corruption on NVAF card
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: minor
    Classification: Unclassified
                OS: Linux (All)
          Reporter: adonai-jwK0Lxh6SN0@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 7.7 (2011)
         Component: Driver/nouveau
           Product: xorg

Created attachment 97517
  --> https://bugs.freedesktop.org/attachment.cgi?id=97517&action=edit
nouveau debug log with PDISP=debug,DEVINIT=debug

Good time of day.

I have MacBook with ArchLinux installed.
When resuming after suspend, there is minor screen corruption. It looks loke
small dashed line, approximately half of screen height, fading to transparent
at both sides. It is oriented vertically, moves from top of the screen to the
bottom, then appears again.

I'm attaching here Xorg log and nouveau.debug dmesg log with normal boot ->
suspend -> wake.

My versions of packages:
local/xorg-server 1.15.1-1 (xorg)
local/xf86-video-nouveau 1.0.10-2 (xorg-drivers xorg)
local/mesa 10.1.0-5
local/linux 3.14.1-1 (base)

I also can bring any information you need. Really want to help.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397742882.1B2FaEA1.2292
Date: Thu, 17 Apr 2014 13:54:42 +0000
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
   title="NEW --- - Minor screen corruption on NVAF card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77574">77574</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Minor screen corruption on NVAF card
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>minor
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
          <td>adonai&#64;xaker.ru
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
          <td>7.7 (2011)
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
        <pre>Created <span class=""><a href="attachment.cgi?id=97517" name="attach_97517" title="nouveau debug log with PDISP=debug,DEVINIT=debug">attachment 97517</a> <a href="attachment.cgi?id=97517&amp;action=edit" title="nouveau debug log with PDISP=debug,DEVINIT=debug">[details]</a></span>
nouveau debug log with PDISP=debug,DEVINIT=debug

Good time of day.

I have MacBook with ArchLinux installed.
When resuming after suspend, there is minor screen corruption. It looks loke
small dashed line, approximately half of screen height, fading to transparent
at both sides. It is oriented vertically, moves from top of the screen to the
bottom, then appears again.

I'm attaching here Xorg log and nouveau.debug dmesg log with normal boot -&gt;
suspend -&gt; wake.

My versions of packages:
local/xorg-server 1.15.1-1 (xorg)
local/xf86-video-nouveau 1.0.10-2 (xorg-drivers xorg)
local/mesa 10.1.0-5
local/linux 3.14.1-1 (base)

I also can bring any information you need. Really want to help.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397742882.1B2FaEA1.2292--

--===============0617458381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0617458381==--

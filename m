From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73744] New: Constant lock ups with NVIDIA GeForce
	8400 GS
Date: Fri, 17 Jan 2014 15:04:20 +0000
Message-ID: <bug-73744-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1052578411=="
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


--===============1052578411==
Content-Type: multipart/alternative; boundary="1389971060.06deA1.26127"; charset="us-ascii"


--1389971060.06deA1.26127
Date: Fri, 17 Jan 2014 15:04:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73744

          Priority: medium
            Bug ID: 73744
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Constant lock ups with NVIDIA GeForce 8400 GS
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: blocker
    Classification: Unclassified
                OS: Linux (All)
          Reporter: grave_123-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Hello,

I am currently using the non-free NVIDIA drivers with a GeForce 8400 GS. My
screen locks up whenever I use Nouveau to the point where I have to
hard-shutdown my machine. I can't afford hardware damage so I'm temporarily
using the non-free drivers.

Anyway ...

I am not sure what specifically causes the lock ups. I can not get to an
emergency terminal to determine the cause in the moment either. At first,
everything but the mouse cursor and sound seizes up and then those two seize up
and there's excessive HDD activity. My only choice is to press and hold the pwr
button and wait for it to shutdown.

I don't currently have a log file for the issue. I will switch back to Nouveau
once I get a response of some kind. Haha.


OS: Ubuntu GNU/Linux x86-64 13.10
Linux: 3.11.0-15-generic
Graphics Card: NVIDIA GeForce 8400 GS
X.Org version: 1.14.5

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389971060.06deA1.26127
Date: Fri, 17 Jan 2014 15:04:20 +0000
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
   title="NEW --- - Constant lock ups with NVIDIA GeForce 8400 GS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73744">73744</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Constant lock ups with NVIDIA GeForce 8400 GS
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
          <td>grave_123&#64;riseup.net
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
        <pre>Hello,

I am currently using the non-free NVIDIA drivers with a GeForce 8400 GS. My
screen locks up whenever I use Nouveau to the point where I have to
hard-shutdown my machine. I can't afford hardware damage so I'm temporarily
using the non-free drivers.

Anyway ...

I am not sure what specifically causes the lock ups. I can not get to an
emergency terminal to determine the cause in the moment either. At first,
everything but the mouse cursor and sound seizes up and then those two seize up
and there's excessive HDD activity. My only choice is to press and hold the pwr
button and wait for it to shutdown.

I don't currently have a log file for the issue. I will switch back to Nouveau
once I get a response of some kind. Haha.


OS: Ubuntu GNU/Linux x86-64 13.10
Linux: 3.11.0-15-generic
Graphics Card: NVIDIA GeForce 8400 GS
X.Org version: 1.14.5</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389971060.06deA1.26127--

--===============1052578411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1052578411==--

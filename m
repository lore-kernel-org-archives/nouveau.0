From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73342] New: nouveau not working with yuy2 overlay
Date: Tue, 07 Jan 2014 02:35:14 +0000
Message-ID: <bug-73342-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0811765476=="
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


--===============0811765476==
Content-Type: multipart/alternative; boundary="1389062114.da53FC81.18512"; charset="us-ascii"


--1389062114.da53FC81.18512
Date: Tue, 7 Jan 2014 02:35:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73342

          Priority: medium
            Bug ID: 73342
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nouveau not working with yuy2 overlay
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: fbs777-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: 7.7 (2011)
         Component: Driver/nouveau
           Product: xorg

For many years im using ubuntu (since nouveau becomes the default nvidia
driver) and never have problem with the yuy2 scalemode mame option, so i think
there's a regression with nouveau version in ubuntu 13.10.

I cant get video when open mame with "-video soft -sm yuy2" options using the
nouveau driver. The game runs with sound, but in full black screen.
Using "-video soft -sm none" the game runs with video, the problem is with yuy2
scalemode.

Tested with Ubuntu 13.10 (kernels 3.11 and 3.12 from ubuntu repos.), mame .151
and .152, nouveau driver.

To reproduce (dont need any rom): execute the mame (mamedev.org) with the
command line "./mame -video soft -sm yuy2" and mame will open totally in black
screen. With the command "./mame -video soft -sm none" will open normally (in
this case with a red bar warning about no roms).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389062114.da53FC81.18512
Date: Tue, 7 Jan 2014 02:35:14 +0000
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
   title="NEW --- - nouveau not working with yuy2 overlay"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73342">73342</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau not working with yuy2 overlay
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
          <td>fbs777&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
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
        <pre>For many years im using ubuntu (since nouveau becomes the default nvidia
driver) and never have problem with the yuy2 scalemode mame option, so i think
there's a regression with nouveau version in ubuntu 13.10.

I cant get video when open mame with &quot;-video soft -sm yuy2&quot; options using the
nouveau driver. The game runs with sound, but in full black screen.
Using &quot;-video soft -sm none&quot; the game runs with video, the problem is with yuy2
scalemode.

Tested with Ubuntu 13.10 (kernels 3.11 and 3.12 from ubuntu repos.), mame .151
and .152, nouveau driver.

To reproduce (dont need any rom): execute the mame (mamedev.org) with the
command line &quot;./mame -video soft -sm yuy2&quot; and mame will open totally in black
screen. With the command &quot;./mame -video soft -sm none&quot; will open normally (in
this case with a red bar warning about no roms).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389062114.da53FC81.18512--

--===============0811765476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0811765476==--
